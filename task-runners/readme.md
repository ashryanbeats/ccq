# ccq and task runners

This directory contains examples of how you might use `ccq` with common task runners.

## gulp

**What the runner does**

This runner starts or restarts Photoshop at the following times:

1. When you first run gulp
1. Anytime you create, update, or destroy a `.jsx` file in your working directory or below

**Setup**

1. Place `gulpfile.js` in your working directory
1. Change the `relaunchCommand` variable string to point to where you have stored `ccq.sh`
1. **Important**: `ccq` is faster when `relaunchCommand` uses `ccq`'s `-f` flag to force quit Photoshop. _Force quitting is destructive_ if you have unsaved changes that you want to keep. Append ` -f` to the `relaunchCommand` string for a quicker but destructive experience.
1. Install and start gulp from your working directory
  ```
  $ npm init                        # create a package.json file
  $ npm i --save gulp run-sequence  # install dependencies
  $ gulp                            # start the gulp watcher
  ```
