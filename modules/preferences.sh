#!/bin/bash

echo -e "${ARROW}Changing macOS defaults..."

# Dock
defaults write com.apple.dock "autohide" -bool true # Autohide
defaults write com.apple.dock "autohide-delay" -float "0" # Disable delay on mouse over
defaults write com.apple.dock expose-group-apps -bool true # Groups windows by application on mission control
defaults write com.apple.dock "mru-spaces" -bool false # Disable rearrange Spaces automatically
defaults write com.apple.dock "show-recents" -bool false # Disable recents
defaults write com.apple.dock static-only -bool true # only show open apps on dock

# Finder
defaults write com.apple.finder "ShowPathbar" -bool true # Show path bar
defaults write com.apple.finder "ShowStatusBar" -bool true # Show status bar
defaults write com.apple.finder "FXPreferredViewStyle" -string Nlsv # List view
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true # Keep folders on top
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" # Search scope current folder
defaults write com.apple.finder "CreateDesktop" -bool true # Disable desktop icons
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool false # Disable drive icon on desktop

# Screencapture 
defaults write com.apple.screencapture "location" -string "~/Pictures"

# Privacy
defaults write com.apple.AdLib.plist allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib.plist allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib.plist personalizedAdsMigrated -bool false

killall Dock && killall Finder && killall SystemUIServer # Restart dock and finder to apply changes
