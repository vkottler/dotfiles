#!/bin/bash

###############################################################################
#                                 Global Symbols                              #
###############################################################################
HOME_STRING=$(echo ~)
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
INSTALL_LIST="git vim subversion gcc-arm-none-eabi spotify-client"
echo "Updating & Upgrading . . ."
sudo apt-get update && sudo apt-get upgrade -y
echo "Installing $INSTALL_LIST"
sudo apt-get install $INSTALL_LIST -y

# Install Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
if [ $? -ne 0 ] then
sudo apt-get install -f -y
fi
rm google-chrome*.deb
###############################################################################


###############################################################################
#                               Make New Directories                          #
###############################################################################
DIRS_TO_MAKE="$HOME_STRING/bin $REPO_DIR"
echo "Creating directories: $DIRS_TO_MAKE"
mkdir -p $DIRS_TO_MAKE
###############################################################################


###############################################################################
#                               Update Dot Files                              #
###############################################################################
git clone https://github.com/vkottler/dotfiles.git $HOME_STRING/dotfiles
~/dotfiles/updateVimLocal.sh
~/dotfiles/appendBashrc.sh
###############################################################################


###############################################################################
#                             Clone Git Repositories                          #
###############################################################################
GITHUB_URL="https://github.com"
REPOS_TO_CLONE=(\
"badgerloop-software/st32.git" \
"madison-embedded/gcc-builds.git" \
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

exit 0

