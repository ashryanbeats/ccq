#!/bin/sh
script=$BASH_SOURCE
path=${script%/*}
filename="/mikael-cho-214358.jpg"

osascript -e 'quit app "Photoshop CC"'

# This while loop doesn't work because PS is purged from launchctl immediately
# while [ '$(launchctl list | grep "Photoshop")' != "" ]
# do
#   echo "Waiting..."
#   echo "'$(launchctl list | grep "Photoshop")'"
#   break
# done

# This is an inelegant workaround for issue with the above while loop
sleep 3

open -a "Adobe Photoshop CC 2017"  $path$filename
