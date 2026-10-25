local mods = require("modifiers")
local programs = require("programs")

hl.bind(mods.mod .. "+ slash", hl.dsp.exec_cmd(programs.ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Keybind Cheatsheet" })

hl.bind(mods.mod .. "+ grave", hl.dsp.exec_cmd("ghostty --class=com.dotfiles.Screensaver -e screensaver"), { description = "Screensaver"} )

