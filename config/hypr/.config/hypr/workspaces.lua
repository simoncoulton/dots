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

hl.window_rule({
    match = { title = "^(World of Warcraft)$" },
    float = true,
    fullscreen = true,
    -- Forces focus to remain locked/restored instantly when entering the workspace
    --stayfocused = true,
    
    -- Prevents Wine from sending minimize/resize requests when switching workspaces
    suppress_event = "fullscreen maximize activate activatefocus x11configurerequest",
    
    -- Tells Hyprland this is a game to optimize latency and cursor behaviors
    content = "game"
})

