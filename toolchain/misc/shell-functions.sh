call_windows_git_command () {
	# find windows git installation in system path
	IFS=";"
	for i in $WINDOWS_PATH
	do
		if [[ $i == *\\Git\\* ]];
		then
			WINDOWS_GIT_PATH=$(cygpath -u $i)
		fi
	done

	# temporarily change HOME variable to system user home to start the gui
	HOME_OLD="$HOME"
	HOME="$USERPROFILEPATH"
	command "$WINDOWS_GIT_PATH/$1" "${@:2}";
	HOME=$HOME_OLD
}
