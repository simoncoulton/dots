local font = "JetBrainsMono Nerd Font 10"

hl.on("hyprland.start", function()
	--hl.exec_cmd("waybar")
	--hl.exec_cmd("hyprpaper")
	--hl.exec_cmd("hypridle")

	--hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
--	get_element_hitbox.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
--	hl.exec_cmd("wl-clip-persist --clipboard regular --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'")

--	hl.exec_cmd("hypridle-inhibit")

  -- GTK3 needs adw-gtk3 to pick up the colours Noctalia generates
  hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"')
  hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
  for _, key in ipairs({ "font-name", "document-font-name", "monospace-font-name" }) do
    hl.exec_cmd('gsettings set org.gnome.desktop.interface ' .. key .. ' "' .. font .. '"')
  end
  hl.exec_cmd("noctalia")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
