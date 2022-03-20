set -e

HOME_BIN=$HOME/bin

remove_and_link() {
	mkdir -p $HOME/`dirname $1`
	rm -f $HOME/$1
	ln -sf $(pwd)/$2/$1 $HOME/$1
	echo "linking file '$(pwd)/$2/$1' to '$HOME/$1'"
}

remove_and_link_dir() {
	mkdir -p $(pwd)/$1
	rm -f $HOME/$1
	ln -sf $(pwd)/$1 $HOME/$1
	echo "linking directory '$(pwd)/$1' to '$HOME/$1'"
}

link_dep() {
	rm -f $HOME/.bash_includes/$1
	ln -sf $(pwd)/deps/$1 $HOME/.bash_includes/$1
	echo "linking '$(pwd)/deps/$1' into .bash_includes"
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
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
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

clone_third_party_github() {
	mkdir -p $THIRD_PARTY
	pushd $THIRD_PARTY >/dev/null

	if [ ! -d $2 ]; then
		git clone git@github.com:$1/$2.git
		echo "Cloned '$1/$2'."
	else
		echo "Not cloning '$1/$2', already present."
	fi

	popd >/dev/null
}
