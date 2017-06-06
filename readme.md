# ccq

`ccq` quits Photoshop and relaunches it with a file, all from the command line, a frequent and tedious maneuver when developing [CEP panels](https://github.com/adobe-CEP/).

## Limitations

- macOS only (reliance on `osascript`)
- bash only (reliance on `$BASH_SOURCE`)

## Usage

For now, you'll need to download and execute the script directly (`./path/to/ccq.sh`), or create an alias for it in your shell profile.

Use the `-f` flag to kill Photoshop. Use wisely; this is dangerous.

## Task runners

Check the `task-runners` directory for ideas on how to use this script with task runners.

## Included image

The included image comes from Unsplash.com, and is licensed under Creative Commons Zero, as noted here:
https://unsplash.com/license

You can find the image online here:
https://unsplash.com/@mikael?photo=_3TDkAttcaM

## Contributing

By all means.

See the [Limitations](#limitations) section for ideas.

Also, a few things on my mind for further improvements:

- Remove the dependency on `sleep` (see the source code for notes)
- Add flags to make this script work for other CC apps (perhaps like `--ps`, `--il`, etc)
  - `-A` flag for quitting all apps
- Ability to specify a file to open, defaulting to the current image in this repo
