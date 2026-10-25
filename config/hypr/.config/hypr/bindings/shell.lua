local keys = require("keys")
local programs = require("programs")

-- Noctalia Panels
keys.exec_all({
	{ "super+shift+comma", programs.ipc .. " panel-toggle control-center", "Noctalia Control Center" },
	{ "super+comma", programs.ipc .. " settings-toggle", "Noctalia Settings" },
})
