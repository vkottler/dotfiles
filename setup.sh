remove_and_link() {
	mkdir -p $HOME/`dirname $1`
	ln -sf $(pwd)/$1 $HOME/$1
}

remove_and_link_dir() {
	rm -f $HOME/$1
	ln -s $(pwd)/$1 $HOME/$1
}

link_dep() {
	ln -sf $(pwd)/bash_deps/$1 $HOME/.bash_includes/$1
}
