local mods = require("modifiers")
local programs = require("programs")

hl.bind(mods.super .. "+slash", hl.dsp.exec_cmd(programs.ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Keybind Cheatsheet" })

hl.bind(mods.super .. "+grave", hl.dsp.exec_cmd("ghostty --class=com.dotfiles.Screensaver -e screensaver"), { description = "Screensaver"} )
