local mods = require("modifiers")
local programs = require("programs")

hl.bind(mods.mod .. "+ slash", hl.dsp.exec_cmd(programs.ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Keybind Cheatsheet" })

--hl.bind(mods.mod .. " + R", hl.dsp.exec_cmd(programs.openMenu), { description = "Open Launcher" })

--hl.bind(mods.mod .. " + " .. mods.mod3 .. " + Space", hl.dsp.exec_cmd(mods.menus .. "/keybinds-menu"), { description = "Keybinds" })
--h1.bind(mods.mod .. " + " .. mods.mod2 .. " + P", hl.dsp.exec_cmd(mods.menus .. "/packages-menu"), { description = "Package Management" })

--hl.bind(mods.mod .. " + P", hl.dsp.exec_cmd(mods.menus .. "/power-menu"), { description = "Power Menu" })

--hl.bind(mods.mod .. " + R", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme menuonly -display-columns 2 | cliphist decode | wl-copy"), { description = "Clipboard" })
--hl.bind(mods.mod .. " + " .. mods.mod2 .. " + R", hl.dsp.exec_cmd("cliphist wipe"), { description = "Clear Clipboard" })
