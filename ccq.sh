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
	    sleep 5
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

sleep 6

# The following opens a location in the default browser. Chrome is my default browser this works for me.
# I ran into a very complicated error with Sierra being unable to find available browsers, so I don't invoke Chrome directly here.
osascript -e 'open location "http://localhost:8088"
			tell application "Google Chrome" to activate'
echo "done!"

# Optionally, activate Photoshop again to bring it to the foreground:
#osascript -e 'activate application "${appnamefull}"'

## The following was intended to open devtools, but it actually opens the debugger for devtools.
## Removed the code, but fyi in case we ever try to chase this down.
# tell application "System Events" to keystroke "j" using {option down, command down}
# tell application "Google Chrome" to activate
# delay 1
# tell application "System Events" to keystroke tab
# delay 1
# tell application "System Events" to keystroke return'
