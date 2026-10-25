local keys = require("keys")
local programs = require("programs")

keys.exec_all({
	{ "super+Return", programs.terminal, "Terminal" },

	{ "super+B", programs.openBrowser, "Browser" },
	{ "super+shift+B", programs.openBrowserDev, "Browser (Dev)" },

	{ "super+M", programs.openMusic, "Music Player" },
	{ "super+shift+M", programs.openAudioVisualiser, "Audio Visualiser" },
	{ "super+alt+M", programs.openAudioControls, "Audio Controls" },

	{ "super+ctrl+F", programs.openFileManagerTui, "File Manager (TUI)" },
	{ "super+shift+Return", programs.openFileManagerGui, "File Manager (GUI)" },

	{ "super+Space", programs.openMenu, "Menu" },
	{ "super+shift+C", programs.openConfig, "Hyprland Config" },

	{ "super+E", programs.openEditor, "Text Editor" },
	{ "super+shift+E", programs.openIDE, "IDE" },

	{ "super+backslash", programs.openPasswordManager, "Password Manager" },
	{ "super+P", programs.openColorPicker, "Color Picker" },
	{ "super+D", programs.openDiskAnalyser, "Disk Analyser" },
})
