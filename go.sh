#!/bin/bash

clear
echo "Welcome to Focused Labs!"
echo "I'm happy to help you install a few apps to start out!"
echo "First of all, do you like [c]hrome or [f]irefox? (c)"
read browser
browser=${browser:-c}
sleep 1
clear
echo "Hmm..."
sleep 2
echo "Interesting choice..."
sleep 1
echo "Let's start by grabbing a few standard apps..."
sleep 1
echo "I'm going to open a few browser windows for native app installs. Feel free to download and install"
open https://pop.com/download/mac
sleep 1
read -p "Press enter to continue..."
clear

echo "How about a few nifty tools?"

echo "Would you like to install Rectangle (a MacOS window manager)? y, [n], or l to learn more"
read rect_yn
rect_yn=${rect_yn:-n}

if [[ $rect_yn = "l" ]]
then
    echo "Move and resize windows in macOS with snap areas and shortcuts."
    echo "Use by pressing ^+⌥+arrows"
    echo "Would you like to install it? y or [n]"
    read rect_yn
    rect_yn=${rect_yn:-n}
fi

if [[ $rect_yn = "y" ]]
then
    echo "You won't regret it!"
    echo "Installing Recatangle..."
    brew install -q --cask rectangle
fi

echo "Would you like to install Flycut (a MacOS clipboard manager)? y, [n], or l to learn more"
read flycut_yn
flycut_yn=${flycut_yn:-n}

if [[ $flycut_yn = "l" ]]
then
    # TODO update this with info + shortcuts
    echo ""
    echo "Would you like to install it? y or [n]"
    read flycut_yn
    flycut_yn=${flycut_yn:-n}
fi

if [[ $flycut_yn = "y" ]]
then
    echo "Installing Flycut..."
    brew install -q --cask flycut
fi

echo "I'm going to install Homebrew, this will take a while"
read -p "Press enter to begin..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zshrc
# source ~/.zshrc
clear
echo "Now that the tougher stuff is done, time to automate a few installs!"
sleep 1
if [[ $browser = "c" ]]
then
    echo "Installing chrome"
    /opt/homebrew/bin/brew install -q --cask google-chrome
else
    echo "Installing firefox"
    /opt/homebrew/bin/brew install -q --cask firefox
fi

#echo "Installing Altair (GraphQL)"
#brew install -q altair-graphql-client
echo "Installing Slack"
/opt/homebrew/bin/brew install -q slack
echo "Installing iTerm2"
/opt/homebrew/bin/brew install -q iterm2
echo "Installing nvm and the current Node LTS"
/opt/homebrew/bin/brew install -q nvm
echo "Installing Jetbrains Toolbox"
/opt/homebrew/bin/brew install -q --cask jetbrains-toolbox
echo "Installing 1Password"
/opt/homebrew/bin/brew install -q --cask 1password
echo "Installing Zoom"
/opt/homebrew/bin/brew install -q --cask zoom
source $(/opt/homebrew/bin/brew --prefix nvm)/nvm.sh
nvm install --lts
nvm use --lts

clear
echo "I just installed your browser, iTerm2, and nvm and Node"
echo "I also installed JetBrains Toolbox, 1Password, and Zoom, but you'll need to open and log into these..."
echo "Also, remember to install your favorite JetBrains IDEs from Toolbox!"
echo "..."
echo "One last thing! Be sure to run the below command to add Homebrew to your PATH:"
echo "echo \"export PATH=/opt/homebrew/bin:$PATH\" >> ~/.zshrc && source ~/.zshrc"
echo "Have fun!"