#!/bin/bash

defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder DSDontWriteNetworkStores -bool TRUE
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Screenshot shortcuts on ctrl+shift+<num> (matches hyprland), freeing cmd+shift+<num> for aerospace.
# parameters = (ascii, keycode, modifiers); ctrl+shift = 393216. Needs a logout to apply.
screenshot_key() {
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$1" \
		"<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>$2</integer><integer>$3</integer><integer>393216</integer></array><key>type</key><string>standard</string></dict></dict>"
}
screenshot_key 28 49 18  # Screenshot to file (full screen): ctrl+shift+1
screenshot_key 30 52 21  # Screenshot to file (selection): ctrl+shift+4
screenshot_key 184 53 23 # Screenshot and recording options: ctrl+shift+5

killall Finder