local programs = require("programs")

-- Configure what these relate to in programs.lua
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(programs.ipc .. " brightness-up"), { description = "Brightness Up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(programs.ipc .. " brightness-down"), { description = "Brightness Down" })
