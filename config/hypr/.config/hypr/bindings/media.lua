local keys = require("keys")

local held = { repeating = true, locked = true }

keys.exec_all({
	{ "XF86AudioRaiseVolume", "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", "Volume Up", held },
	{ "XF86AudioLowerVolume", "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", "Volume Down", held },
	{ "XF86AudioMute", "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", "Mute Audio", held },
	{ "XF86AudioMicMute", "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", "Mute Mic", held },
})

keys.exec_all({
	{ "XF86AudioNext", "playerctl next", "Media Next", { locked = true } },
	{ "XF86AudioPause", "playerctl play-pause", "Media Pause", { locked = true } },
	{ "XF86AudioPlay", "playerctl play-pause", "Media Play", { locked = true } },
	{ "XF86AudioPrev", "playerctl previous", "Media Previous", { locked = true } },
})
