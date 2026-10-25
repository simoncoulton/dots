local mods = require("modifiers")

hl.bind(mods.alt .. "+Tab", hl.dsp.window.cycle_next(), { description = "Alt Tab" })
hl.bind(mods.alt .. "+" .. mods.shift .. "+Tab", hl.dsp.window.cycle_next({ next = false }), { description = "Alt Tab (Reverse)" })

hl.bind(mods.super .. "+Q", hl.dsp.window.close(), { description = "Close Active" })
hl.bind(mods.super .. "+" .. mods.shift .. "+V", hl.dsp.layout("togglesplit"), { description = "Toggle Split" })
hl.bind(mods.super .. "+" .. mods.alt .. "+f", hl.dsp.window.float(), { description = "Toggle Floating" })

-- Move focus and window with mod+vim keys
hl.bind(mods.super .. "+h", hl.dsp.focus({ direction = "l" }), { description = "Move Focus Left" })
hl.bind(mods.super .. "+l", hl.dsp.focus({ direction = "r" }), { description = "Move Focus Right" })
hl.bind(mods.super .. "+k", hl.dsp.focus({ direction = "u" }), { description = "Move Focus Up" })
hl.bind(mods.super .. "+j", hl.dsp.focus({ direction = "d" }), { description = "Move Focus Down" })
hl.bind(mods.super .. "+" .. mods.shift .. "+h", hl.dsp.window.move({ direction = "l" }), { description = "Move Window Left" })
hl.bind(mods.super .. "+" .. mods.shift .. "+j", hl.dsp.window.move({ direction = "d" }), { description = "Move Window Down" })
hl.bind(mods.super .. "+" .. mods.shift .. "+k", hl.dsp.window.move({ direction = "u" }), { description = "Move Window Up" })
hl.bind(mods.super .. "+" .. mods.shift .. "+l", hl.dsp.window.move({ direction = "r" }), { description = "Move Window Right" })

-- Resize active window
hl.bind(mods.super .. "+minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Resize Window Smaller" })
hl.bind(mods.super .. "+equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Resize Window Larger" })
hl.bind(mods.super .. "+" .. mods.shift .. "+minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Resize Window Smaller (Vertical)" })
hl.bind(mods.super .. "+" .. mods.shift .. "+equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Resize Window Larger (Vertical)" })

for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mods.super .. "+" .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to Workspace " .. key })
  hl.bind(mods.super .. "+" .. mods.shift .. "+" .. key, hl.dsp.window.move({ workspace = i }), { description = "Move Window to Workspace " .. key })
end

hl.bind(mods.super .. "+mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(mods.super .. "+mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })
