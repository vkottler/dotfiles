#!/bin/bash

###############################################################################
#                                 Global Symbols                              #
###############################################################################
HOME_STRING=$(echo ~)
REPO_DIR=$(echo $HOME_STRING/Documents/gitRepos)
###############################################################################


###############################################################################
#                               Install New Software                          #
###############################################################################
INSTALL_LIST="git vim subversion gcc-arm-none-eabi"
echo "Updating & Upgrading . . ."
sudo apt-get update && sudo apt-get upgrade -y
echo "Installing $INSTALL_LIST"
sudo apt-get install $INSTALL_LIST
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
~/dotfiles/UpdateVimLocal.sh
~/dotfiles/appendBashrc.sh
###############################################################################


###############################################################################
#                             Clone Git Repositories                          #
###############################################################################
git config --global user.email "vkottler@wisc.edu"
git config --global user.name "vkottler"
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

