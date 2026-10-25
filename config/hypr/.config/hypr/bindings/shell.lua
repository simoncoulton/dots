local mods = require("modifiers")
local programs = require("programs")

-- Noctalia Panels
hl.bind(mods.super .. "+" .. mods.shift .. "+comma", hl.dsp.exec_cmd(programs.ipc .. " " .. "panel-toggle control-center"), { description = "Noctalia Control Center"})
hl.bind(mods.super .. "+comma", hl.dsp.exec_cmd(programs.ipc .. " " .. "settings-toggle"), { description = "Noctalia Settings"})
