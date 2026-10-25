local mods = require("modifiers")
local programs = require("programs")

hl.bind(mods.super .. "+Return", hl.dsp.exec_cmd(programs.terminal), { description = "Terminal" })

hl.bind(mods.super .. "+B", hl.dsp.exec_cmd(programs.openBrowser), { description = "Browser" })
hl.bind(mods.super.. "+" .. mods.shift .. "+B", hl.dsp.exec_cmd(programs.openBrowserDev), { description = "Browser (Dev)" })

hl.bind(mods.super .. "+T", hl.dsp.exec_cmd(programs.openActivityMonitor), { description = "Activity Monitor" })
hl.bind(mods.super .. "+" .. mods.shift .. "+T", hl.dsp.exec_cmd(programs.openSystemCtl), { description = "System Control" })

hl.bind(mods.super .. "+M", hl.dsp.exec_cmd(programs.openMusic), { description = "Music Player" })
hl.bind(mods.super .. "+" .. mods.shift .. "+M", hl.dsp.exec_cmd(programs.openAudioVisualiser), { description = "Audio Visualiser" })
hl.bind(mods.super .. "+" .. mods.alt .. "+M", hl.dsp.exec_cmd(programs.openAudioControls), { description = "Audio Controls" })

hl.bind(mods.super .. "+F", hl.dsp.exec_cmd(programs.openFileManagerTui), { description = "File Manager (TUI)" })
hl.bind(mods.super .. "+" .. mods.shift .. "+F", hl.dsp.exec_cmd(programs.openFileManagerGui), { description = "File Manager (GUI)" })

hl.bind(mods.super .. "+Space", hl.dsp.exec_cmd(programs.openMenu), { description = "Menu" })
hl.bind(mods.super .. "+" .. mods.shift .. "+C", hl.dsp.exec_cmd(programs.openConfig), { description = "Hyprland Config" })

hl.bind(mods.super .. "+E", hl.dsp.exec_cmd(programs.openEditor), { description = "Text Editor" })
hl.bind(mods.super .. "+" .. mods.shift .. "+E", hl.dsp.exec_cmd(programs.openIDE), { description = "IDE" })

hl.bind(mods.super .. "+backslash", hl.dsp.exec_cmd(programs.openPasswordManager), { description = "Password Manager" })

hl.bind(mods.super .. "+P", hl.dsp.exec_cmd(programs.openColorPicker), { description = "Color Picker" })

hl.bind(mods.super .. "+D", hl.dsp.exec_cmd(programs.openDiskAnalyser), { description = "Disk Analyser"})
