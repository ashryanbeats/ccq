#!/bin/sh
script=$BASH_SOURCE
path=${script%/*}
filename="/res/example-image.jpg"
appnamefull="Adobe Photoshop CC 2018"
appnameshort="Photoshop CC"

if pgrep -xq -- "${appnamefull}"; then
	if [ -z "$1" ]
		then
			cmd="quit app \"$appnameshort\""
			echo "$cmd"
	    osascript -e "$cmd"

	    # This while loop doesn't work because PS is purged from launchctl immediately
	    # while [ '$(launchctl list | grep "Photoshop")' != "" ]
	    # do
	    #   echo "Waiting..."
	    #   echo "'$(launchctl list | grep "Photoshop")'"
	    #   break
	    # done

	    # This is an inelegant workaround for issue with the above while loop
	    sleep 8
	fi

	while [ "$1" != "" ] # loop through args
	do
	  ARG="$1"

	  case $ARG in
	    -f) # force
	      kill -9 $(pgrep "${appnameshort}")

				sleep 2

	      shift
	      ;;

	    *) # spin through any other args
				shift
				;;

		esac
	done
fi

open -a "${appnamefull}" $path$filename
