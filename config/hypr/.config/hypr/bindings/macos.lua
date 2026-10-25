local mods = require("modifiers")

hl.bind(mods.super .. "+C", hl.dsp.send_shortcut({ mods = mods.ctrl, key = "Insert" }), { description = "Copy" })
hl.bind(mods.super .. "+V", hl.dsp.send_shortcut({ mods = mods.shift, key = "Insert" }), { description = "Paste" })
hl.bind(mods.super .. "+X", hl.dsp.send_shortcut({ mods = mods.ctrl, key = "X" }), { description = "Cut" })
hl.bind(mods.super .. "+Z", hl.dsp.send_shortcut({ mods = mods.ctrl, key = "Z" }), { description = "Undo" })
hl.bind(mods.super .. "+A", hl.dsp.send_shortcut({ mods = mods.ctrl, key = "A" }), { description = "Select All"})

