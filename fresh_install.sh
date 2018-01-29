#!/bin/bash

###############################################################################
#                                 Global Symbols                              #
###############################################################################
HOME_STRING=$(echo ~)
USERNAME=$(whoami)
REPO_DIR=$(echo $HOME_STRING/Documents/gitRepos)
###############################################################################


###############################################################################
#                                 Add Key Servers                             #
###############################################################################

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
###############################################################################


###############################################################################
#                               Install New Software                          #
###############################################################################
INSTALL_LIST="git vim tmux subversion gtkterm gcc-arm-none-eabi spotify-client network-manager-openconnect-gnome"
echo "Updating & Upgrading . . ."
sudo apt-get update && sudo apt-get upgrade -y
echo "Installing $INSTALL_LIST"
sudo apt-get install $INSTALL_LIST -y

# Install Chrome
#sudo apt-get install libxss1 libappindicator1 libindicator7
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome*.deb
#rm google-chrome*.deb

# Install JLink Utilities
#wget https://www.segger.com/downloads/jlink/JLink_Linux_V616_x86_64.deb
#sudo dpkg -i JLink*.deb
#rm JLink*.deb
#wget https://www.segger.com/downloads/jlink/ozone_2.40.2_x86_64.deb
#sudo dpkg -i ozone*.deb
#rm ozone*.deb

# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.6.2-amd64.deb
sudo dpkg -i slack*.deb
rm slack*.deb
###############################################################################


###############################################################################
#                               Make New Directories                          #
###############################################################################
DIRS_TO_MAKE="$HOME_STRING/bin $REPO_DIR $HOME_STRING/Documents/svn"
echo "Creating directories: $DIRS_TO_MAKE"
mkdir -p $DIRS_TO_MAKE
###############################################################################


###############################################################################
#                               Update Dot Files                              #
###############################################################################
# This has to already be cloned to be available
#git clone https://github.com/vkottler/dotfiles.git $HOME_STRING/dotfiles
~/dotfiles/link_vimrc.sh
~/dotfiles/appendBashrc.sh
sudo usermod -a -G dialout $USERNAME
sudo usermod -a -G plugdev $USERNAME

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
###############################################################################


###############################################################################
#                             Clone Git Repositories                          #
###############################################################################
git config --global user.email "vkottler@wisc.edu"
git config --global user.name "vkottler"
GITHUB_URL="https://github.com"
REPOS_TO_CLONE=(\
"badgerloop-software/pod3_gcc.git" \
"badgerloop-software/pod3_documentation.git" \
"badgerloop-software/pod3_dashboard.git" \
"badgerloop-software/pod3_server.git" \
"vkottler/personal-homepage.git" \
)

for i in ${REPOS_TO_CLONE[@]}; do
	REPO_NAME=$(echo $i | awk -F '/' '{print $2}')
	REPO_NAME=$(echo $REPO_NAME | sed 's/\(.*\)\..*/\1/')
	REPO_DESTINATION="$REPO_DIR/$REPO_NAME"
	echo "Cloning $i into $REPO_DESTINATION"
	git clone $GITHUB_URL/$i $REPO_DESTINATION
done
###############################################################################


###############################################################################
#                             Clone SVN Repositories                          #
###############################################################################
svn co http://svn.badgerloop.com/pod $HOME_STRING/Documents/svn/pod
###############################################################################

vim +PluginInstall +qall

echo "Make sure to run 'source ~/.bashrc' for new shell configurations to take hold!"
exit 0

