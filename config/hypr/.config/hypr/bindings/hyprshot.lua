local mods = require("modifiers")

hl.bind(mods.mod .. " + " .. mods.mod2 .. " + S", hl.dsp.exec_cmd("hyprshot -m region"), { description = "Screenshot Region" })
hl.bind(mods.mod .. " + " .. mods.mod3 .. " + S", hl.dsp.exec_cmd("hyprshot -m active -m window"), { description = "Screenshot Active" })
hl.bind(mods.mod .. " + " .. mods.mod4 .. " + S", hl.dsp.exec_cmd("hyprshot -m output"), { description = "Screenshot Desktop" })

hl.layer_rule({
	name = "no_anim_for_selection",
	match = { namespace = "selection" },
	no_anim = true,
})
