remove_and_link() {
	rm -f $HOME/$1
	mkdir -p $HOME/`dirname $1`
	ln -s $(pwd)/$1 $HOME/$1
}

remove_and_link_dir() {
	rm -f $HOME/$1
	ln -s $(pwd)/$1 $HOME/$1
}

link_dep() {
	rm -f $HOME/.bash_includes/$1
	ln -s $(pwd)/bash_deps/$1 $HOME/.bash_includes/$1
}
