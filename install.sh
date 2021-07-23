PWD=$(pwd)

# getting the latest packages
apt-get update
apt-get upgrade

apt-get install curl wget
# VS Code
snap install code --classic

# Discord
snap install discord
snap connect discord:system-observe

# Install better discord
add-apt-repository ppa:chronobserver/betterdiscordctl
apt-get update
apt-get install betterdiscordctl
betterdiscordctl --d-install snap install

# for some odd reason, the snap package for spotifyd didnd't work the last time I tried
# I should however try that before compiling the thing from source
# snap install spotifyd
# More about running it as a systemd service here -> https://spotifyd.github.io/spotifyd/config/services/Sytemd.html

# Below are the instructions to build it from source

# apt install rustc cargo libasound2-dev libssl-dev pkg-config
# git clone https://github.com/Spotifyd/spotifyd.git
# cd spotifyd
# cargo build --release
# ./target/release/spotifyd

# Since building from source takes a while, I've added the binary to this repo. If even this doesn't work,
# building from source might be the only option
cp $PWD/bin/spotify /usr/bin/spotifyd 
systemctl --user start spotifyd.service
systemctl --user enable spotifyd.service

# Installing spotify TUI(https://github.com/Rigellute/spotify-tui#installation)
snap install spt
# Also before running this make sure to add the username and password in the config file (located ~/.config/spotifyd)


# Oh my posh
# For some reason, python powerline refuses to work anymore. Oh my posh seems like a good alterative
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

# Setting up mouse gestures for GNOME. Last checked on Gnome 3.38
# Github here -> https://github.com/bulletmark/libinput-gestures

# Adding to user group
$USER=shashwat
gpasswd -a $USER input

# Getting dependencies
apt-get install wmctrl xdotool
apt-get install libinput-tools
apt-get install build-essential

# installing libinput gestures
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
make install

##########################################################################################
# Following are the Gnome extensions I use. They work well with my mouse gestures
# 1.https://extensions.gnome.org/extension/545/hide-top-bar/
# 2.https://extensions.gnome.org/extension/708/panel-osd/
# 3.https://extensions.gnome.org/extension/1040/random-wallpaper/
# 4.https://extensions.gnome.org/extension/1485/workspace-matrix/
# 5.https://extensions.gnome.org/extension/3740/compiz-alike-magic-lamp-effect/
# 6.https://extensions.gnome.org/extension/97/coverflow-alt-tab/

# setting up the symlinks
rm ~/.bashrc ~/.bash_aliases
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash_aliases ~/.bash_aliases
ln -s $PWD/.config/kitty ~/.config
ln -s $PWD/.config/lsd ~/.config
ln -s $PWD/.config/oh_my_posh ~/.config
ln -s $PWD/.config/spotifyd ~/.config
ln -s $PWD/.config/libinput-gestures.conf ~/.config

# Now installing the fish shell
apt-add-repository ppa:fish-shell/release-3 -y
apt-get update
apt-get install fish

chsh -s /usr/bin/fish

# Installing fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# Install NVM for fish shell
fisher install jorgebucaran/nvm.fish


echo "DONE!"
