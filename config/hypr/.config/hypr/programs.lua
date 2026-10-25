local editor = "nvim"
local terminal = "ghostty"
local fileManagerTui = "yazi"
local fileManagerGui = "strata"
local browser = "zen-browser"
local browserDev = "chromium"
local ipc = "noctalia msg"
local menu = "launcher"
local activityMonitor = "btop"
local systemctl = "systemctl-tui"
local config = os.getenv("HOME") .. "/.config/hypr/hyprland.lua"
local passwordManager = "1password"
local audioControls = "wiremix"
local audioVisualiser = "cava"
local music = "cliamp"
local colorPicker = "oldirtty/color_picker:panel"
local ide = "code"
local diskAnalyser = "dua"

local termClass = "--class=com.dotfiles."

return {
	editor = editor,
	terminal = terminal,
	fileManagerTui = fileManagerTui,
	fileManagerGui = fileManagerGui,
	browser = browser,
	browserDev = browserDev,
	menu = menu,
	activityMonitor = activityMonitor,
	config = config,
	passwordManager = passwordManager,
	audioControls = audioControls,
	audioVisualiser = audioVisualiser,
	music = music,
	colorPicker = colorPicker,
	ipc = ipc,
	ide = ide,
	diskAnalyser = diskAnalyser,

	openEditor = terminal .. " --class=com.dotfiles." .. editor .. " -e " .. editor,
	openTerminal = terminal,
	openFileManagerTui = "EDITOR=" .. editor .. " " .. terminal .. " --class=com.dotfiles." .. fileManagerTui .. " -e " .. fileManagerTui,
	openFileManagerGui = fileManagerGui,
	openBrowser = browser,
	openBrowserDev = browserDev,
	openMenu = ipc .. " panel-toggle " .. menu,
	openActivityMonitor = terminal .. " " .. termClass .. activityMonitor .. " -e " .. activityMonitor,
	openSystemCtl = terminal .. " " .. termClass .. systemctl .. " -e " .. systemctl,
	openConfig = terminal .. " -e " .. editor .. " " .. config,
	openPasswordManager = passwordManager,
	openAudioControls = terminal .. " " .. termClass .. audioControls .. " -e " .. audioControls,
	openAudioVisualiser = terminal .. " " .. termClass .. audioVisualiser .. " -e " .. audioVisualiser,
	openMusic = terminal .. " " .. termClass .. music .. " -e " .. music,
	openColorPicker = ipc .. " panel-toggle " .. colorPicker,
	openIDE = ide,
	openDiskAnalyser = terminal .. " " .. termClass .. diskAnalyser .. " -e " .. diskAnalyser .. " i"
}
