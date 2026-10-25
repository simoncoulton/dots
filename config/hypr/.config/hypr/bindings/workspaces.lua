local keys = require("keys")

keys.bind_all({
	{ "alt+Tab", hl.dsp.window.cycle_next(), "Alt Tab" },
	{ "alt+shift+Tab", hl.dsp.window.cycle_next({ next = false }), "Alt Tab (Reverse)" },

	{ "super+Q", hl.dsp.window.close(), "Close Active" },
	{ "super+shift+V", hl.dsp.layout("togglesplit"), "Toggle Split" },
	{ "super+alt+f", hl.dsp.window.float(), "Toggle Floating" },

	-- Move focus and window with mod+vim keys
	{ "super+h", hl.dsp.focus({ direction = "l" }), "Move Focus Left" },
	{ "super+l", hl.dsp.focus({ direction = "r" }), "Move Focus Right" },
	{ "super+k", hl.dsp.focus({ direction = "u" }), "Move Focus Up" },
	{ "super+j", hl.dsp.focus({ direction = "d" }), "Move Focus Down" },
	{ "super+shift+h", hl.dsp.window.move({ direction = "l" }), "Move Window Left" },
	{ "super+shift+j", hl.dsp.window.move({ direction = "d" }), "Move Window Down" },
	{ "super+shift+k", hl.dsp.window.move({ direction = "u" }), "Move Window Up" },
	{ "super+shift+l", hl.dsp.window.move({ direction = "r" }), "Move Window Right" },

	-- Resize active window
	{ "super+minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), "Resize Window Smaller" },
	{ "super+equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), "Resize Window Larger" },
	{ "super+shift+minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), "Resize Window Smaller (Vertical)" },
	{ "super+shift+equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), "Resize Window Larger (Vertical)" },

	{ "super+mouse:272", hl.dsp.window.drag(), "Move window", { mouse = true } },
	{ "super+mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true } },
})

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	keys.bind("super+" .. key, hl.dsp.focus({ workspace = i }), "Switch to Workspace " .. key)
	keys.bind("super+shift+" .. key, hl.dsp.window.move({ workspace = i }), "Move Window to Workspace " .. key)
end
