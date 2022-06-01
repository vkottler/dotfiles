set -e

HOME_BIN=$HOME/bin

link_repo_rel_home_rel() {
	mkdir -p `dirname $HOME/$2`
	rm -f $HOME/$2
	ln -s $REPO/$1 $HOME/$2
	echo "Linked repository '$1' to '~/$2'."
}

link_dep() {
	rm -f $HOME/.bash_includes/$1
	ln -sf $REPO/bash/deps/$1 $HOME/.bash_includes/$1
	echo "Linked 'bash/deps/$1' into .bash_includes."
}

source_if_wsl() {
	if [[ `uname -r` == *"microsoft"*  ]]; then
		source $1
	else
		source $2
	fi
}

source_if_ubuntu() {
	if [[ `uname -v` == *"Ubuntu"* ]] && ! [[ `uname -r` == *"microsoft"* ]]; then
		source $1
	else
		source $2
	fi
}

# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
	curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
	grep '"tag_name":' |                                              # Get tag line
	sed -E 's/.*"([^"]+)".*/\1/'                                      # Pluck JSON value
}

attempt_ping() {
	ping -c 1 $1 >/dev/null
}

add_file_to_remote() {
	attempt_ping $1

	if ssh $USER@$1 stat $2 \> /dev/null 2\>\&1
	then
		echo "'$2' exists on '$1', skipping"
	else
		printf "moving '%s' to '%s' ... " $2 $1
		rsync -a --ignore-existing $2 $USER@$1:$2
		echo "done"
	fi
}

THIRD_PARTY=$HOME/third-party

clone_third_party_ssh() {
	mkdir -p $THIRD_PARTY
	pushd $THIRD_PARTY >/dev/null

	if [ ! -d $2 ]; then
		git clone $3@$4:$1/$2.git
		echo "Cloned '$1/$2'."
	else
		echo "Not cloning '$1/$2', already present."
	fi

	popd >/dev/null
}

clone_third_party_https() {
	mkdir -p $THIRD_PARTY
	pushd $THIRD_PARTY >/dev/null

	if [ ! -d $2 ]; then
		git clone https://$1/$2.git
		echo "Cloned '$2'."
	else
		echo "Not cloning '$2', already present."
	fi

	popd >/dev/null
}

clone_third_party_github() {
	clone_third_party_ssh $1 $2 git github.com
}

clone_third_party_git() {
	mkdir -p $THIRD_PARTY
	pushd $THIRD_PARTY >/dev/null

	if [ ! -d $2 ]; then
		git clone git://$1/$2.git
		echo "Cloned '$2'."
	else
		echo "Not cloning '$2', already present."
	fi

	popd >/dev/null
}

clone_third_party_gnu() {
	clone_third_party_git git.savannah.gnu.org $1
}

clone_kernel_repo() {
	clone_third_party_git git.kernel.org/pub/scm/$1 $2
}

ensure_home_venv() {
	if [ -z "$PYTHON_VERSION" ]; then
		echo 'set $PYTHON_VERSION first'
		exit 1
	fi

	# Create the standard venv if necessary.
	HOME_VENV=$HOME/venv$PYTHON_VERSION
	if [ ! -d $HOME_VENV ]; then
		python$PYTHON_VERSION -m venv $HOME_VENV
	fi

	# Create a symlink for convenience (i.e. adding to path).
	if [ ! -L $HOME/venv ]; then
		ln -s $HOME/venv$PYTHON_VERSION $HOME/venv
	fi

	# Set useful variables.
	HOME_PYTHON="$HOME_VENV/bin/python"
	HOME_PIP="$HOME_PYTHON -m pip"
}

get_gnu_release() {
	pushd $THIRD_PARTY >/dev/null

	# Download an archive if one isn't present.
	if [ ! -f $1-$2.tar.gz ]; then
		wget https://ftp.gnu.org/gnu/$1/$1-$2.tar.gz
	fi

	# Unpack it.
	if [ ! -d $1-$2 ]; then
		tar xvf $1-$2.tar.gz
	fi

	popd >/dev/null
}

exit_if_command() {
	if command -v $1 >/dev/null; then
		echo "Command '$1' found, exiting early."
		exit 0
	fi

	echo "Command '$1' not found, continuing."
}
