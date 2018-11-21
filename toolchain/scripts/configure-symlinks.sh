#!/bin/sh
USERPROFILEPATH="$(cygpath $USERPROFILE)"

# link .gitconfig and .ssh from local home to system wide configuration if there's none yet
if [[ (-L ~/.gitconfig || ! -e ~/.gitconfig) && -e "$USERPROFILEPATH/.gitconfig" ]]; then
	ln -sf $USERPROFILEPATH/.gitconfig ~/.gitconfig
fi

if  [[ (-L ~/.ssh || ! -e ~/.ssh) && -e "$USERPROFILEPATH/.ssh" ]]; then
	ln -sf $USERPROFILEPATH/.ssh ~/.ssh
fi
