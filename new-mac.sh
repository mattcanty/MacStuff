#!/bin/bash

# Prerequisites
## Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# System Preferences
## Dock
defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock "show-recents" -int 0
defaults write com.apple.dock tilesize -int 37
defaults write com.apple.dock largesize -int 49
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock "minimize-to-application" -int 1
## Hot Corners
defaults write com.apple.dock "wvous-br-corner" -int 4 # Show Desktop
defaults write com.apple.dock "wvous-br-modifier" -int 0
defaults write com.apple.dock "wvous-tr-corner" -int 10 # Lock Screen
defaults write com.apple.dock "wvous-tr-modifier" -int 0
## Finder
defaults write com.apple.finder AppleShowAllFiles -string YES
defaults write com.apple.finder ShowStatusBar -int 1
defaults write com.apple.finder ShowPathbar -int 1
defaults write com.apple.finder SidebarTagsSctionDisclosedState -int 0
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -int 1
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -int 0
## Other
defaults write ~/Library/Preferences/.GlobalPreferences.plist "com.apple.trackpad.forceClick" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "WebAutomaticSpellingCorrectionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "AppleActionOnDoubleClick" -string "Maximize"
defaults write ~/Library/Preferences/.GlobalPreferences.plist "AppleInterfaceStyle" -string "Dark"
defaults write ~/Library/Preferences/.GlobalPreferences.plist "CGDisableCursorLocationMagnification" -int 1
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticCapitalizationEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticDashSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticPeriodSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticQuoteSubstitutionEnabled" -int 0
defaults write ~/Library/Preferences/.GlobalPreferences.plist "NSAutomaticSpellingCorrectionEnabled" -int 0
## Battery
defaults write com.apple.menuextra.battery ShowPercent YES
## Clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"
defaults write com.apple.menuextra.clock FlashDateSeparators int 0
defaults write com.apple.menuextra.clock IsAnalog -int 0
## Three finger drag
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "TrackpadThreeFingerDrag" -int 1 
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "TrackpadThreeFingerDrag" -int 1
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "TrackpadThreeFingerHorizSwipeGesture" -int 0
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "TrackpadThreeFingerHorizSwipeGesture" -int 0
defaults write ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist "Clicking" -int 1 
defaults write ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist "Clicking" -int 1

# Additional Software and Tools
## Slack
brew cask install slack
## Spotify
brew cask install spotify
## IntelliJ IDEA
brew cask install intellij-idea
## CircleCI CLI
curl -fLSs https://circle.ci/cli | bash
## Oh My Zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## Dockutil
brew install dockutil

# Dock Cleanup
dockutil --remove 'Mail' --no-restart
dockutil --remove 'Contacts' --no-restart
dockutil --remove 'Maps' --no-restart
dockutil --remove 'Photos' --no-restart
dockutil --remove 'Messages' --no-restart
dockutil --remove 'FaceTime' --no-restart
dockutil --remove 'News' --no-restart
dockutil --remove 'App Store' --no-restart
dockutil --remove 'Launchpad' --no-restart
dockutil --remove 'Siri' --no-restart
dockutil --remove 'Downloads' --no-restart
dockutil --remove 'Notes' --no-restart
dockutil --remove 'Reminders' --no-restart
dockutil --remove 'Pages' --no-restart
dockutil --remove 'Numbers' --no-restart
dockutil --remove 'Keynote' --no-restart
dockutil --remove 'iTunes' --no-restart
dockutil --add "/Applications/IntelliJ IDEA.app" --after 'Safari' --no-restart
dockutil --add "/Applications/Spotify.app" --after 'Safari' --no-restart
dockutil --add "/Applications/Slack.app" --after 'Safari' --no-restart
dockutil --add "/Applications/Utilities/Terminal.app" --after 'Safari' --no-restart

# Restart Desktop
killall Dock
killall Finder
killall SystemUIServer

# Finito
echo ""
echo "All done, cheers 🙌"
echo "You will need to logout and back in again for some changes to take effect!"
