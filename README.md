# README

Assuming you've got Arch installed (btw)

```
cd install
./packages.sh
./configs.sh
sudo ./bins.sh # These are going in /usr/local/bin
```

CMD+ALT+SPACE to open the keybind menu

Credit to DDH for some of the bin's, go support Omarchy https://github.com/basecamp/omarchy
## Zen browser transparency

Zen's profile is not tracked here (the profile directory name is generated per install), so the transparent sidebar needs a manual setup.

1. Install the **Transparent Zen** mod (by sameerasw) from Zen's Settings > Mods, and enable its transparent sidebar option.
2. In `about:config`, set:

   | Pref                                           | Value       | Purpose                                              |
   | ---------------------------------------------- | ----------- | ---------------------------------------------------- |
   | `zen.widget.linux.transparency`                | `true`      | Allow transparent windows on Linux                   |
   | `mod.sameerasw.zen_transparent_sidebar_enabled`| `true`      | Enable the mod's transparent sidebar                 |
   | `mod.sameerasw.zen_transparency_color`         | `#RRGGBBAA` | Sidebar background tint; `AA` is the opacity         |

   For example, `#1e1e2e99` is a dark tint at about 60% opacity. `#00000000` is fully transparent. Only the background is affected, not the text.
3. Restart Zen.
