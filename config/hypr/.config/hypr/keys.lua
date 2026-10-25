-- Keybind helpers. Combos are written as "super+shift+B"; modifiers are
-- case-insensitive, the last token is the key. Duplicate combos are reported
-- at load time so clashes between binding files can't go unnoticed.
local M = {}

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

-- Forward a different shortcut to the focused window: keys.send("super+C", "ctrl+Insert", "Copy")
function M.send(combo, target, desc)
	local modset, key = split(target)
	local mods = {}
	for _, m in ipairs(order) do
		if modset[m] then mods[#mods + 1] = m end
	end
	M.bind(combo, hl.dsp.send_shortcut({ mods = table.concat(mods, " "), key = key }), desc)
end

-- Table-driven: each row is { combo, dispatcher, description, opts? }
function M.bind_all(rows)
	for _, r in ipairs(rows) do M.bind(r[1], r[2], r[3], r[4]) end
end

-- Table-driven exec: each row is { combo, command, description, opts? }
function M.exec_all(rows)
	for _, r in ipairs(rows) do M.exec(r[1], r[2], r[3], r[4]) end
end

-- Table-driven shortcut forwarding: each row is { combo, target, description }
function M.send_all(rows)
	for _, r in ipairs(rows) do M.send(r[1], r[2], r[3]) end
end

return M
