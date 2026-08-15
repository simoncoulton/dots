hl.window_rule({
	name = "suppress-maximise-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "no_focus",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = true,
		pin = true,
	},
	no_focus = true,
})

hl.window_rule({
	name = "float_terminals",
	match = { class = "^(com.dotfiles.PackageManager|Updater)$" },
	float = true,
})

hl.window_rule({
	name = "fullscreen",
	match = { class = "^(com.dotfiles.Screensaver)$" },
	fullscreen = true,
})
