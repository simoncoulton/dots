hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 0,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		natural_scroll = true,
		touchpad = {
		natural_scroll = true,
		tap_button_map = "lmr"
		}
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
