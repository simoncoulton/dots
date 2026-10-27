hl.config({
  misc = {
    disable_autoreload = true
  }
})

require("monitors")
require("programs")
require("autostart")
require("envs")
require("lookandfeel")
require("input")
require("bindings")
require("workspaces")
-- Noctalia's apply.sh greps this file for require("noctalia"); the call itself lives in theme.lua
require("theme")
