#!/usr/bin/env bash
# Claude Code statusline: model, dir/git, context, cost, burn rate, lines, rate limits.
input=$(cat)

# Pull everything in one jq call (tab-separated; empty string when missing)
IFS=$'\t' read -r model dir cost dur_ms added removed ctx_pct ctx_size in_tok \
  five_pct five_reset week_pct week_reset style < <(
  jq -r '[
    (.model.display_name // "Claude"),
    (.workspace.current_dir // .cwd // ""),
    (.cost.total_cost_usd // 0),
    (.cost.total_duration_ms // 0),
    (.cost.total_lines_added // 0),
    (.cost.total_lines_removed // 0),
    (.context_window.used_percentage // ""),
    (.context_window.context_window_size // 200000),
    ((.context_window.current_usage.input_tokens // 0)
      + (.context_window.current_usage.cache_read_input_tokens // 0)
      + (.context_window.current_usage.cache_creation_input_tokens // 0)),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.five_hour.resets_at // ""),
    (.rate_limits.seven_day.used_percentage // ""),
    (.rate_limits.seven_day.resets_at // ""),
    (.output_style.name // "")
  ] | map(tostring | if . == "" then "_" else . end) | join("\t")' <<<"$input"
)

for v in model dir cost dur_ms added removed ctx_pct ctx_size in_tok five_pct five_reset week_pct week_reset style; do
  [[ ${!v} == _ ]] && printf -v "$v" ''
done
cost=${cost:-0}; dur_ms=${dur_ms:-0}; added=${added:-0}; removed=${removed:-0}; in_tok=${in_tok:-0}; ctx_size=${ctx_size:-200000}

R=$'\e[0m'; DIM=$'\e[2m'; B=$'\e[1m'
RED=$'\e[31m'; GRN=$'\e[32m'; YEL=$'\e[33m'; BLU=$'\e[34m'; MAG=$'\e[35m'; CYN=$'\e[36m'

# colour by severity (higher = worse)
sev() { local v=${1%.*}; v=${v:-0}
  if   (( v >= 85 )); then printf '%s' "$RED"
  elif (( v >= 60 )); then printf '%s' "$YEL"
  else printf '%s' "$GRN"; fi; }

# Usage bar for a rate-limit window: filled = usage, ┃ = how far through the window time is.
# Usage fill ahead of the marker means you're burning faster than the clock.
limit_bar() { # pct reset_epoch window_secs
  local pct=${1%.*} reset=$2 win=$3 w=10 now el mark f i out="" c
  pct=${pct:-0}; (( pct > 100 )) && pct=100
  f=$(( (pct * w + 50) / 100 )); mark=-1
  if [[ -n $reset ]]; then
    now=$(date +%s); el=$(( win - (reset - now) ))
    (( el < 0 )) && el=0; (( el > win )) && el=$win
    mark=$(( el * w / win )); (( mark >= w )) && mark=$((w-1))
  fi
  if (( mark >= 0 && pct * win > 100 * el )); then c=$YEL; else c=$GRN; fi
  (( pct >= 90 )) && c=$RED
  for ((i=0;i<w;i++)); do
    if   (( i == mark )); then out+="${R}${B}┃${R}${c}"
    elif (( i < f ));     then out+="█"
    else                       out+="${DIM}░${R}${c}"; fi
  done
  printf '%s%s%s' "$c" "$out" "$R"; }

human_tok() { awk -v n="$1" 'BEGIN{ if(n>=1e6) printf "%.1fM",n/1e6; else if(n>=1e3) printf "%.0fk",n/1e3; else printf "%d",n }'; }

until_reset() { # epoch seconds -> "2h13m" / "3d4h"
  local t=$1 now d; [[ -z $t ]] && return
  now=$(date +%s); d=$(( t - now )); (( d <= 0 )) && { printf 'now'; return; }
  if   (( d >= 86400 )); then printf '%dd%dh' $((d/86400)) $((d%86400/3600))
  elif (( d >= 3600  )); then printf '%dh%02dm' $((d/3600)) $((d%3600/60))
  else printf '%dm' $((d/60)); fi
  # clock time of the reset
  printf ' %s@%s %s' $'\e[0m\e[38;5;238m' $'\e[0m\e[2m' "$(date -d "@$t" +%H:%M)"; }

SEP="${DIM} │ ${R}"

# --- Line 1: model · dir · git · style
line1="${B}${CYN}${model}${R}"
if [[ -n $dir ]]; then
  short="${dir/#$HOME/~}"
  # keep last 2 path components
  short=$(awk -F/ '{n=NF; if(n>3) printf "…/%s/%s",$(n-1),$n; else print $0}' <<<"$short")
  line1+="${SEP}${BLU}${short}${R}"
  if git -C "$dir" rev-parse --is-inside-work-tree &>/dev/null; then
    br=$(git -C "$dir" symbolic-ref --short HEAD 2>/dev/null || git -C "$dir" rev-parse --short HEAD 2>/dev/null)
    st=$(git -C "$dir" status --porcelain 2>/dev/null)
    staged=$(grep -c '^[MADRC]' <<<"$st"); mod=$(grep -c '^.[MD]' <<<"$st"); unt=$(grep -c '^??' <<<"$st")
    read -r behind ahead < <(git -C "$dir" rev-list --left-right --count '@{u}...HEAD' 2>/dev/null || echo "0 0")
    g="${MAG} ${br}${R}"
    (( staged > 0 )) && g+=" ${GRN}+${staged}${R}"
    (( mod    > 0 )) && g+=" ${YEL}~${mod}${R}"
    (( unt    > 0 )) && g+=" ${DIM}?${unt}${R}"
    (( ahead  > 0 )) && g+=" ${GRN}↑${ahead}${R}"
    (( behind > 0 )) && g+=" ${RED}↓${behind}${R}"
    line1+="${SEP}${g}"
  fi
fi

# --- Language / toolchain detection (cwd only, like starship). Versions cached 60s.
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/claude-statusline"; mkdir -p "$CACHE_DIR" 2>/dev/null
cached_ver() { # key cmd... -> first version-looking token
  local key=$1; shift
  local f="$CACHE_DIR/$(printf '%s' "$dir:$key" | md5sum | cut -c1-16)" v
  if [[ -f $f && $(( $(date +%s) - $(stat -c %Y "$f") )) -lt 60 ]]; then cat "$f"; return; fi
  v=$(cd "$dir" && timeout 2 "$@" 2>&1 | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)
  printf '%s' "$v" | tee "$f"; }
has() { local f; for f in "$@"; do [[ -e $dir/$f ]] && return 0; done; return 1; }
tool() { # label colour version [extra]
  [[ -z $3 ]] && return
  tools+=("${2}${1} ${3}${R}${4:+ ${DIM}$4${R}}"); }

tools=()
if [[ -n $dir && -d $dir ]]; then
  if has package.json .nvmrc .node-version; then
    pm=""
    if   has bun.lockb bun.lock;   then pm=bun
    elif has pnpm-lock.yaml;       then pm=pnpm
    elif has yarn.lock;            then pm=yarn
    elif has package-lock.json;    then pm=npm; fi
    tool "⬢" "$GRN" "$(cached_ver node node -v)" "$pm"
  fi
  has deno.json deno.jsonc && tool "🦕" "$GRN" "$(cached_ver deno deno --version)"
  if has requirements.txt pyproject.toml Pipfile setup.py setup.cfg poetry.lock uv.lock .python-version tox.ini; then
    pm=""
    if   has uv.lock;                         then pm=uv
    elif has poetry.lock;                     then pm=poetry
    elif has Pipfile Pipfile.lock;            then pm=pipenv
    elif has pdm.lock;                        then pm=pdm
    elif has requirements.txt;                then pm=pip
    elif grep -qs '^\[tool\.poetry\]' "$dir/pyproject.toml"; then pm=poetry; fi
    # prefer the project's venv interpreter if present
    py=python3; for v in .venv venv; do [[ -x $dir/$v/bin/python ]] && { py="$dir/$v/bin/python"; break; }; done
    [[ -n $VIRTUAL_ENV ]] && pm+="${pm:+ }($(basename "$VIRTUAL_ENV"))"
    [[ -z $VIRTUAL_ENV && $py != python3 ]] && pm+="${pm:+ }(venv)"
    tool "🐍" "$YEL" "$(cached_ver python "$py" --version)" "$pm"
  fi
  has Cargo.toml  && tool "🦀" "$RED" "$(cached_ver rust rustc --version)"
  has go.mod      && tool "🐹" "$CYN" "$(cached_ver go go version)"
  has Gemfile .ruby-version && tool "💎" "$RED" "$(cached_ver ruby ruby -v)"
  has composer.json         && tool "🐘" "$MAG" "$(cached_ver php php -v)"
  if has pom.xml build.gradle build.gradle.kts; then
    tool "☕" "$YEL" "$(cached_ver java java -version)"
  fi
  has mix.exs     && tool "💧" "$MAG" "$(cached_ver elixir elixir --version)"
  has Dockerfile docker-compose.yml docker-compose.yaml compose.yaml && tools+=("${BLU}🐳${R}")
  has main.tf     && tool "💠" "$MAG" "$(cached_ver terraform terraform version)"
  if (( ${#tools[@]} )); then
    tl=""; for t in "${tools[@]}"; do tl+="${tl:+ }$t"; done
    line1+="${SEP}${tl}"
  fi
fi
[[ -n $style && $style != default ]] && line1+="${SEP}${DIM}${style}${R}"

# --- Line 2: context · cost · burn · time · lines
parts=()
if [[ -n $ctx_pct ]]; then
  c=$(sev "$ctx_pct")
  used=$(human_tok "$in_tok"); tot=$(human_tok "$ctx_size")
  parts+=("ctx ${c}${ctx_pct%.*}%${R} ${DIM}${used}/${tot}${R}")
else
  parts+=("ctx ${DIM}–${R}")
fi

# Billing mode: env vars for API/cloud providers, else no rate_limits after a response => token billing.
api=0
if [[ -n $ANTHROPIC_API_KEY || -n $ANTHROPIC_AUTH_TOKEN || -n $CLAUDE_CODE_USE_BEDROCK || -n $CLAUDE_CODE_USE_VERTEX || -n $CLAUDE_CODE_USE_FOUNDRY ]]; then api=1
elif [[ -z $five_pct && -z $week_pct ]] && awk -v c="$cost" 'BEGIN{exit !(c>0)}'; then api=1; fi

# Burn-rate thresholds ($/h), override via env
BURN_WARN=${CC_BURN_WARN:-3}; BURN_HIGH=${CC_BURN_HIGH:-8}
cost_s=$(printf '$%.2f' "$cost")
mins=$(awk -v d="$dur_ms" 'BEGIN{printf "%.1f", d/60000}')
rate=""; rate_c=$DIM
if awk -v m="$mins" 'BEGIN{exit !(m>=1)}'; then
  rate_n=$(awk -v c="$cost" -v m="$mins" 'BEGIN{printf "%.2f", c/m*60}')
  rate=$(printf '$%s/h' "$rate_n")
  if (( api )); then
    if   awk -v r="$rate_n" -v t="$BURN_HIGH" 'BEGIN{exit !(r>=t)}'; then rate_c="${B}${RED}"
    elif awk -v r="$rate_n" -v t="$BURN_WARN" 'BEGIN{exit !(r>=t)}'; then rate_c=$YEL
    else rate_c=$GRN; fi
  fi
fi
if (( api )); then
  parts+=("${YEL}${cost_s}${R}")
  [[ -n $rate ]] && parts+=("${rate_c}${rate}${R}")
else
  parts+=("${DIM}~${cost_s}${R}")
  [[ -n $rate ]] && parts+=("${DIM}${rate}${R}")
fi

secs=$(( ${dur_ms%.*} / 1000 ))
if   (( secs >= 3600 )); then t=$(printf '%dh%02dm' $((secs/3600)) $((secs%3600/60)))
elif (( secs >= 60 ));   then t=$(printf '%dm' $((secs/60)))
else t=$(printf '%ds' "$secs"); fi
parts+=("⏱ ${t}")

(( added > 0 || removed > 0 )) && parts+=("${GRN}+${added}${R}${DIM}/${R}${RED}-${removed}${R}")

# --- Rate limits (Pro/Max subscribers only), shown first
limits=()
if [[ -n $five_pct ]]; then
  r="5h $(limit_bar "$five_pct" "$five_reset" 18000) ${five_pct%.*}%"
  rs=$(until_reset "$five_reset"); [[ -n $rs ]] && r+=" ${DIM}↻${rs}${R}"
  limits+=("$r")
fi
if [[ -n $week_pct ]]; then
  r="7d $(limit_bar "$week_pct" "$week_reset" 604800) ${week_pct%.*}%"
  rs=$(until_reset "$week_reset"); [[ -n $rs ]] && r+=" ${DIM}↻${rs}${R}"
  limits+=("$r")
fi

line2=""
for p in "${limits[@]}" "${parts[@]}"; do line2+="${line2:+$SEP}$p"; done

printf '%s\n%s\n' "$line1" "$line2"
