-- Keybind helpers. Combos are written as "super+shift+B"; modifiers are
-- case-insensitive, the last token is the key. Duplicate combos are reported
-- at load time so clashes between binding files can't go unnoticed.
local M = {}

M.scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

local aliases = { super = "SUPER", shift = "SHIFT", alt = "ALT", ctrl = "CTRL" }
local order = { "SUPER", "CTRL", "ALT", "SHIFT" }
local seen = {}

local function split(combo)
	local parts = {}
	for part in combo:gmatch("[^+]+") do
		parts[#parts + 1] = part
	end
	local key = table.remove(parts)
	local modset = {}
	for _, m in ipairs(parts) do
		local mod = aliases[m:lower()]
		assert(mod, "unknown modifier '" .. m .. "' in combo '" .. combo .. "'")
		modset[mod] = true
	end
	return modset, key
end

local function join(modset, key)
	local out = {}
	for _, m in ipairs(order) do
		if modset[m] then out[#out + 1] = m end
	end
	out[#out + 1] = key
	return table.concat(out, "+")
end

local function claim(combo, desc)
	local modset, key = split(combo)
	local id = join(modset, key:lower())
	if seen[id] then
		print(("[keys] clash on %s: '%s' vs '%s'"):format(id, seen[id], desc or "?"))
	end
	seen[id] = desc or "?"
	return join(modset, key)
end

-- keys.bind("super+Q", hl.dsp.window.close(), "Close Active", { locked = true })
function M.bind(combo, dispatcher, desc, opts)
	opts = opts or {}
	opts.description = desc
	hl.bind(claim(combo, desc), dispatcher, opts)
end

function M.exec(combo, cmd, desc, opts)
	M.bind(combo, hl.dsp.exec_cmd(cmd), desc, opts)
end

-- Window classes treated as terminals (substring match, case-insensitive)
M.terminals = { "ghostty", "com.dotfiles" }

local function focused_is_terminal()
	local win = hl.get_active_window()
	local class = win and win.class and win.class:lower() or ""
	for _, t in ipairs(M.terminals) do
		if class:find(t, 1, true) then return true end
	end
	return false
end

local function shortcut(target)
	local modset, key = split(target)
	local mods = {}
	for _, m in ipairs(order) do
		if modset[m] then mods[#mods + 1] = m end
	end
	return hl.dsp.send_shortcut({ mods = table.concat(mods, " "), key = key })
end

-- Forward a different shortcut to the focused window: keys.send("super+C", "ctrl+Insert", "Copy")
-- `term` overrides the target in terminals: a shortcut string, or false to do nothing there.
-- `opts` are bind options, plus `delay` (ms) to send the shortcut after the physical key is let go.
function M.send(combo, target, desc, term, opts)
	opts = opts or {}
	local delay = opts.delay
	opts.delay = nil
	if term == nil and not delay then
		M.bind(combo, shortcut(target), desc, opts)
		return
	end
	local normal = shortcut(target)
	local alt = term and shortcut(term)
	local function fire()
		local d = normal
		if term ~= nil and focused_is_terminal() then d = alt end
		if d then hl.dispatch(d) end
	end
	M.bind(combo, function()
		if delay then
			hl.timer(fire, { timeout = delay, type = "oneshot" })
		else
			fire()
		end
	end, desc, opts)
end

-- Table-driven: each row is { combo, dispatcher, description, opts? }
function M.bind_all(rows)
	for _, r in ipairs(rows) do M.bind(r[1], r[2], r[3], r[4]) end
end

-- Table-driven exec: each row is { combo, command, description, opts? }
function M.exec_all(rows)
	for _, r in ipairs(rows) do M.exec(r[1], r[2], r[3], r[4]) end
end

-- Table-driven shortcut forwarding: each row is { combo, target, description, terminal_target?, opts? }
function M.send_all(rows)
	for _, r in ipairs(rows) do M.send(r[1], r[2], r[3], r[4], r[5]) end
end

return M
