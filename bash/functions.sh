set -e

HOME_BIN=$HOME/bin

remove_and_link() {
	mkdir -p $HOME/`dirname $1`
	ln -sf $(pwd)/$2/$1 $HOME/$1
}

remove_and_link_dir() {
	rm -f $HOME/$1
	mkdir -p $(pwd)/$1
	ln -s $(pwd)/$1 $HOME/$1
}

link_dep() {
	ln -sf $(pwd)/deps/$1 $HOME/.bash_includes/$1
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