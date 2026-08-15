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

-- Switch workspaces
hl.bind(mods.mod .. " + 1", hl.dsp.focus({ workspace = 1 }), { description = "Switch to Workplace 1" })
hl.bind(mods.mod .. " + 2", hl.dsp.focus({ workspace = 2 }), { description = "Switch to Workplace 2" })
hl.bind(mods.mod .. " + 3", hl.dsp.focus({ workspace = 3 }), { description = "Switch to Workplace 3" })
hl.bind(mods.mod .. " + 4", hl.dsp.focus({ workspace = 4 }), { description = "Switch to Workplace 4" })
hl.bind(mods.mod .. " + 5", hl.dsp.focus({ workspace = 5 }), { description = "Switch to Workplace 5" })
hl.bind(mods.mod .. " + 6", hl.dsp.focus({ workspace = 6 }), { description = "Switch to Workplace 6" })
hl.bind(mods.mod .. " + 7", hl.dsp.focus({ workspace = 7 }), { description = "Switch to Workplace 7" })
hl.bind(mods.mod .. " + 8", hl.dsp.focus({ workspace = 8 }), { description = "Switch to Workplace 8" })
hl.bind(mods.mod .. " + 9", hl.dsp.focus({ workspace = 9 }), { description = "Switch to Workplace 9" })
hl.bind(mods.mod .. " + 0", hl.dsp.focus({ workspace = 10 }), { description = "Switch to Workplace 10" })

-- Move active windows
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 1", hl.dsp.window.move({ workspace = 1 }), { description = "Move Window to Workspace 1" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 2", hl.dsp.window.move({ workspace = 2 }), { description = "Move Window to Workspace 2" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 3", hl.dsp.window.move({ workspace = 3 }), { description = "Move Window to Workspace 3" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 4", hl.dsp.window.move({ workspace = 4 }), { description = "Move Window to Workspace 4" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 5", hl.dsp.window.move({ workspace = 5 }), { description = "Move Window to Workspace 5" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 6", hl.dsp.window.move({ workspace = 6 }), { description = "Move Window to Workspace 6" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 7", hl.dsp.window.move({ workspace = 7 }), { description = "Move Window to Workspace 7" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 8", hl.dsp.window.move({ workspace = 8 }), { description = "Move Window to Workspace 8" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 9", hl.dsp.window.move({ workspace = 9 }), { description = "Move Window to Workspace 9" })
hl.bind(mods.mod .. " + " .. mods.mod2 .. " + 0", hl.dsp.window.move({ workspace = 10 }), { description = "Move Window to Workspace 10" })

hl.bind(mods.mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(mods.mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
