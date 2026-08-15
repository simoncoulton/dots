local editor = "nvim"
local terminal = "ghostty"
local fileManagerTui = "yazi"
local fileManagerGui = "nautilus"
local browser = "zen-browser"
local browserDev = "chromium"
local menu = "rofi"
local activityMonitor = "btop"
local config = os.getenv("HOME") .. "/.config/hypr/hyprland.lua"
local passwordManager = "1password"
local audioControls = "wiremix"
local audioVisualiser = "cava"
local music = "ncspot"
local colorPicker = "hyprpicker"

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

	openEditor = terminal .. " --class=com.dotfiles." .. editor .. " -e " .. editor,
	openTerminal = terminal,
	openFileManagerTui = "EDITOR=" .. editor .. " " .. terminal .. " --class=com.dotfiles." .. fileManagerTui .. " -e " .. fileManagerTui,
	openFileManagerGui = fileManagerGui,
	openBrowser = browser,
	openBrowserDev = browserDev,
	openMenu = menu .. " -i -show drun",
	openActivityMonitor = terminal .. " --class=com.dotfiles." .. activityMonitor .. " -e " .. activityMonitor,
	openConfig = terminal .. " -e " .. editor .. " " .. config,
	openPasswordManager = passwordManager,
	openAudioControls = terminal .. " --class=com.dotfiles." .. audioControls .. " -e " .. audioControls,
	openAudioVisualiser = terminal .. " --class=com.dotfiles." .. audioVisualiser .. " -e " .. audioVisualiser,
	openMusic = terminal .. " --class=com.dotfiles." .. music .. " -e " .. music,
	openColorPicker = colorPicker .. " -a",
}
