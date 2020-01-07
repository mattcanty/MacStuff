#!/bin/bash
set +xeu

# Prerequisites
## Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

## Install Brewfile
brew bundle install

# System Preferences
## Keyboard
defaults write -g ApplePressAndHoldEnabled -bool true
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

### VSCode Extenions
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension fabiospampinato.vscode-diff
code --install-extension formulahendry.github-actions
code --install-extension mathiasfrohlich.Kotlin
code --install-extension mauve.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-mssql.mssql
code --install-extension redhat.java
code --install-extension redhat.vscode-yaml
code --install-extension ryu1kn.partial-diff
code --install-extension sidneys1.gitconfig
code --install-extension technosophos.vscode-helm
code --install-extension tht13.html-preview-vscode
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension yzhang.markdown-all-in-one
code --install-extension zhuangtongfa.Material-theme

## ZSH Install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## kube-shell
pip3 install kube-shell

# Dock Cleanup
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
dockutil --remove 'Podcasts' --no-restart
dockutil --remove 'TV' --no-restart
dockutil --remove 'Mail' --no-restart
dockutil --remove 'Calendar' --no-restart
dockutil --remove 'Music' --no-restart
dockutil --remove 'System Preferences' --no-restart
dockutil --remove 'Safari' --no-restart
dockutil --add "/Applications/Firefox.app" --after 'Finder' --no-restart
dockutil --add "/Applications/Visual Studio Code.app" --after 'Finder' --no-restart
dockutil --add "/Applications/Spotify.app" --after 'Finder' --no-restart
dockutil --add "/Applications/Slack.app" --after 'Finder' --no-restart
dockutil --add "/Applications/Utilities/Terminal.app" --after 'Finder' --no-restart

# Restart Desktop
killall Dock
killall Finder
killall SystemUIServer

# Finito
echo ""
echo "All done, cheers 🙌"
echo "You will need to logout and back in again for some changes to take effect!"
