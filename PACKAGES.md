# Packages

Packages are installed by `install/packages.sh` from the lists in `install/packages/`:

| List     | Installed on   | Installed with                                                 |
| -------- | -------------- | -------------------------------------------------------------- |
| `common` | Arch and macOS | `pacman` on Arch, `brew` on macOS                              |
| `arch`   | Arch only      | `yay` by default; `yay:` and `pacman:` prefixes force one      |
| `macos`  | macOS only     | `brew`; the `cask:` prefix installs with `brew install --cask` |

## common

### Shell

| Package                   | Purpose                                          |
| ------------------------- | ------------------------------------------------ |
| `zsh`                     | Login shell                                      |
| `zsh-autosuggestions`     | Fish-like command suggestions from history       |
| `zsh-completions`         | Extra completion definitions for zsh             |
| `zsh-syntax-highlighting` | Syntax highlighting as you type commands         |
| `starship`                | Cross-shell prompt                               |
| `zoxide`                  | Smarter `cd` that remembers frequent directories |
| `fzf`                     | Command-line fuzzy finder                        |

### CLI replacements and utilities

| Package   | Purpose                                                  |
| --------- | -------------------------------------------------------- |
| `bat`     | `cat` clone with syntax highlighting and git integration |
| `eza`     | Modern replacement for `ls`                              |
| `fd`      | Simple, fast alternative to `find`                       |
| `ripgrep` | Fast recursive search, alternative to `grep`             |
| `less`    | Terminal pager                                           |
| `jq`      | Command-line JSON processor                              |
| `yq`      | Command-line YAML/JSON/XML processor                     |
| `tldr`    | Simplified, example-driven man pages                     |
| `stow`    | Symlinks the dotfiles in `config/` into place            |

### System info and disk usage

| Package     | Purpose                                       |
| ----------- | --------------------------------------------- |
| `btop`      | System resource monitor                       |
| `fastfetch` | System information summary (neofetch-like)    |
| `ncdu`      | Interactive disk usage analyser               |
| `duf`       | Disk usage/free overview, alternative to `df` |

### Development

| Package   | Purpose                                         |
| --------- | ----------------------------------------------- |
| `nvim`    | Neovim, the main editor                         |
| `mise`    | Dev tool/runtime version manager and env loader |
| `lazygit` | Terminal UI for git                             |
| `posting` | HTTP/API client that runs in the terminal       |

### Files and media

| Package | Purpose                              |
| ------- | ------------------------------------ |
| `yazi`  | Fast terminal file manager           |
| `mpv`   | Media player                         |

## arch

### Desktop shell and Wayland

| Package                       | Purpose                                                    |
| ----------------------------- | ---------------------------------------------------------- |
| `noctalia`                    | Wayland desktop shell (bar, launcher, notifications, etc.) |
| `hyprpicker`                  | Colour picker for Hyprland/wlroots                         |
| `hyprpolkitagent`             | Polkit authentication agent for Hyprland                   |
| `polkit`                      | Privilege authorisation framework                          |
| `xdg-desktop-portal-hyprland` | Desktop portal backend for Hyprland (screen sharing etc.)  |
| `xdg-desktop-portal-gtk`      | GTK desktop portal backend (file pickers etc.)             |
| `wl-clipboard`                | `wl-copy`/`wl-paste` clipboard utilities                   |
| `wl-clip-persist`             | Keeps clipboard contents after the source app closes       |
| `upower`                      | Power/battery information service                          |

### Fonts

| Package                   | Purpose                  |
| ------------------------- | ------------------------ |
| `ttf-jetbrains-mono-nerd` | JetBrains Mono Nerd Font |
| `ttf-meslo-nerd`          | Meslo LG Nerd Font       |

### Audio and media

| Package     | Purpose                                            |
| ----------- | -------------------------------------------------- |
| `wiremix`   | TUI audio mixer for PipeWire                       |
| `playerctl` | MPRIS media player control (media keys)            |
| `mpv`       | Media player                                       |
| `spotify`   | Spotify client (AUR)                               |
| `cliamp`    | Retro, Winamp-inspired terminal music player (AUR) |

### Docker

| Package          | Purpose                                   |
| ---------------- | ----------------------------------------- |
| `docker`         | Container runtime                         |
| `docker-buildx`  | Docker CLI plugin for BuildKit builds     |
| `docker-compose` | Multi-container definitions for Docker    |
| `lazydocker`     | Terminal UI for Docker and Docker Compose |

### Files, storage and devices

| Package      | Purpose                                                 |
| ------------ | ------------------------------------------------------- |
| `strata-bin` | Keyboard-first GUI file manager (AUR)                   |
| `gvfs-smb`   | GIO virtual filesystem backend for SMB/Windows shares   |
| `gvfs-afc`   | GIO virtual filesystem backend for Apple mobile devices |
| `usbmuxd`    | USB multiplexing daemon for iPhone/iPad connections     |
| `dropbox`    | Dropbox sync client (AUR)                               |
| `localsend`  | Cross-platform AirDrop alternative (AUR)                |
| `unzip`      | Extracts zip archives                                   |

### Applications

| Package                  | Purpose                                   |
| ------------------------ | ----------------------------------------- |
| `ghostty`                | Terminal emulator                         |
| `zen-browser-bin`        | Firefox-based browser (AUR)               |
| `chromium`               | Chromium web browser                      |
| `visual-studio-code-bin` | Visual Studio Code, official binary (AUR) |
| `libreoffice`            | Office suite                              |
| `signal-desktop`         | Signal messenger                          |
| `1password`              | 1Password desktop app (AUR)               |
| `1password-cli`          | 1Password CLI, `op` (AUR)                 |

### Development and AI tooling

| Package    | Purpose                                               |
| ---------- | ----------------------------------------------------- |
| `herdr`    | Terminal workspace manager for AI coding agents (AUR) |
| `hunk-bin` | Review-first terminal diff viewer (AUR)               |

### System utilities

| Package                      | Purpose                                                 |
| ---------------------------- | ------------------------------------------------------- |
| `systemctl-tui`              | TUI for systemd services and their logs                 |
| `pacman-contrib`             | Extra pacman scripts (`paccache`, `checkupdates`, etc.) |
| `man`                        | Man page reader (AUR)                                   |
| `speedtest-cli`              | Internet bandwidth test via speedtest.net (AUR)         |
| `python-terminaltexteffects` | Terminal text visual effects, `tte` (AUR)               |

## macos

| Package                         | Purpose                                  |
| ------------------------------- | ---------------------------------------- |
| `font-meslo-lg-nerd-font`       | Meslo LG Nerd Font                       |
| `font-jetbrains-mono-nerd-font` | JetBrains Mono Nerd Font                 |
| `nikitabobko/tap/aerospace`     | i3-like tiling window manager (cask)     |
| `bjarneo/cliamp/cliamp`         | Retro terminal music player (from tap)   |
| `herdr`                         | Terminal workspace manager for AI agents |
| `hunk`                          | Review-first terminal diff viewer        |
