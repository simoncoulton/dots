local mods = require("modifiers")

hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { description = "Alt Tab" })
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }), { description = "Alt Tab (Reverse)" })

hl.bind(mods.mod .. " + Q", hl.dsp.window.close(), { description = "Close Active" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + V", hl.dsp.layout("togglesplit"), { description = "Toggle Split" })
hl.bind(mods.mod .. " + V", hl.dsp.window.float(), { description = "Toggle Floating" })

-- Move focus and window with mod + vim keys
hl.bind(mods.mod .. " + h", hl.dsp.focus({ direction = "l" }), { description = "Move Focus Left" })
hl.bind(mods.mod .. " + l", hl.dsp.focus({ direction = "r" }), { description = "Move Focus Right" })
hl.bind(mods.mod .. " + k", hl.dsp.focus({ direction = "u" }), { description = "Move Focus Up" })
hl.bind(mods.mod .. " + j", hl.dsp.focus({ direction = "d" }), { description = "Move Focus Down" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + h", hl.dsp.window.move({ direction = "l" }), { description = "Move Window Left" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + j", hl.dsp.window.move({ direction = "d" }), { description = "Move Window Down" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + k", hl.dsp.window.move({ direction = "u" }), { description = "Move Window Up" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + l", hl.dsp.window.move({ direction = "r" }), { description = "Move Window Right" })

-- Resize active window
hl.bind(mods.mod .. " + minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Resize Window Smaller" })
hl.bind(mods.mod .. " + equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Resize Window Larger" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Resize Window Smaller (Vertical)" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Resize Window Larger (Vertical)" })

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mods.mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to Workspace " .. key })
  hl.bind(mods.mod .. " + " .. mods.mod2 .. " + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move Window to Workspace " .. key })
end

hl.bind(mods.mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(mods.mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
