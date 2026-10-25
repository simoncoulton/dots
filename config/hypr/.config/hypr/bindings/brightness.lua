local keys = require("keys")
local programs = require("programs")

-- Configure what these relate to in programs.lua
keys.exec("XF86MonBrightnessUp", programs.ipc .. " brightness-up", "Brightness Up")
keys.exec("XF86MonBrightnessDown", programs.ipc .. " brightness-down", "Brightness Down")
