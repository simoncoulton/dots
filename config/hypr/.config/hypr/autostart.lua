hl.on("hyprland.start", function()
	--hl.exec_cmd("waybar")
	--hl.exec_cmd("hyprpaper")
	--hl.exec_cmd("hypridle")

	--hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
--	get_element_hitbox.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
--	hl.exec_cmd("wl-clip-persist --clipboard regular --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'")

--	hl.exec_cmd("hypridle-inhibit")

--	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
--	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
  hl.exec_cmd("noctalia")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
