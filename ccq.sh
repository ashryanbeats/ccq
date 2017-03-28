#!/bin/sh
script=$BASH_SOURCE
path=${script%/*}
filename="/mikael-cho-214358.jpg"

if [ -z "$1" ]
	then
    osascript -e 'quit app "Photoshop CC"'

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
      kill -9 $(pgrep Photoshop)

			sleep 2

      shift
      ;;

    *) # spin through any other args
			shift
			;;

	esac
done

open -a "Adobe Photoshop CC 2017"  $path$filename
