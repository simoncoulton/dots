local frappe = require("themes/frappe")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,

			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		pseudotile = true, -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
		preserve_split = true, -- You probably want this
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, curve = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, curve = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, curve = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, curve = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, curve = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, curve = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, curve = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, curve = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, curve = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, curve = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, curve = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, curve = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, curve = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, curve = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, curve = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, curve = "almostLinear", style = "fade" })
