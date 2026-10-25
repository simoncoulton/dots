local keys = require("keys")
local programs = require("programs")

keys.exec("super+slash", programs.ipc .. " panel-toggle kenn/keybind-cheatsheet:cheatsheet", "Keybind Cheatsheet")
keys.exec("super+grave", "ghostty --class=com.dotfiles.Screensaver -e screensaver", "Screensaver")
