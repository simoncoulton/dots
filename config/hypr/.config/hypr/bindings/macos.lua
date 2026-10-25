local keys = require("keys")

-- macOS-style shortcuts (Super in place of Cmd), forwarded as the Linux equivalent.
-- Copy/paste use Insert variants so they also work in terminals. A 4th column
-- overrides the target in terminals (false = do nothing) so Super+Z doesn't suspend the shell.
-- Deliberately skipped because Super+<key> is already taken:
--   B (bold), K (link), L (address bar), 1-9 (tabs), Shift+T (reopen tab)
keys.send_all({
	-- Editing
	{ "super+C", "ctrl+Insert", "Copy" },
	{ "super+V", "shift+Insert", "Paste" },
	{ "super+X", "ctrl+X", "Cut" },
	{ "super+Z", "ctrl+Z", "Undo", false, { delay = 100 } },
	{ "super+shift+Z", "ctrl+shift+Z", "Redo", false, { delay = 100 } },
	{ "super+A", "ctrl+A", "Select All", "ctrl+shift+A" },

	-- Documents
	-- Delayed so the physical key is up first: sent immediately, VSCode (native Wayland) auto-repeats "s"
	{ "super+S", "ctrl+S", "Save", nil, { delay = 100 } },
	{ "super+N", "ctrl+N", "New" },
	{ "super+O", "ctrl+O", "Open" },
	{ "super+W", "ctrl+W", "Close Tab" },
	{ "super+R", "ctrl+R", "Reload" },
	{ "super+F", "ctrl+F", "Find" },
	{ "super+shift+F", "ctrl+shift+F", "Find All" },
	{ "super+T", "ctrl+T", "New Tab", false },

	-- Tabs / history
	{ "super+bracketleft", "alt+Left", "Back" },
	{ "super+bracketright", "alt+Right", "Forward" },
	{ "super+shift+bracketleft", "ctrl+Prior", "Previous Tab" },
	{ "super+shift+bracketright", "ctrl+Next", "Next Tab" },

	-- Cursor movement: Cmd+arrows = line/document, Opt+arrows = word
	{ "super+Left", "Home", "Line Start" },
	{ "super+Right", "End", "Line End" },
	{ "super+Up", "ctrl+Home", "Document Start" },
	{ "super+Down", "ctrl+End", "Document End" },
	{ "super+shift+Left", "shift+Home", "Select to Line Start" },
	{ "super+shift+Right", "shift+End", "Select to Line End" },
	{ "super+shift+Up", "ctrl+shift+Home", "Select to Document Start" },
	{ "super+shift+Down", "ctrl+shift+End", "Select to Document End" },
	{ "alt+Left", "ctrl+Left", "Word Left" },
	{ "alt+Right", "ctrl+Right", "Word Right" },
	{ "alt+shift+Left", "ctrl+shift+Left", "Select Word Left" },
	{ "alt+shift+Right", "ctrl+shift+Right", "Select Word Right" },
	{ "alt+BackSpace", "ctrl+BackSpace", "Delete Word" },
})
