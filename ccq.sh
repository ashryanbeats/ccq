#!/bin/sh
osascript -e 'quit app "Photoshop CC"'

# This while loop doesn't work because PS is purged from launchctl immediately
# while [ '$(launchctl list | grep "Photoshop")' != "" ]
# do
#   echo "Waiting..."
#   echo "'$(launchctl list | grep "Photoshop")'"
#   break
# done

sleep 3

open -a "Adobe Photoshop CC 2017" "./warehouse_ash.psd"
