# ccq

`ccq` quits Photoshop and relaunches it with a file, all from the command line, a frequent and tedious maneuver when developing CEP panels.

## Usage

For now, you'll need to download and execute the script directly (`./path/to/ccq.sh`), or create an alias for it in your shell profile.

## Included image

The included image comes from Unsplash.com, and is licensed under Creative Commons Zero, as noted here:
https://unsplash.com/license

## Contributing

By all means.

A few things on my mind for improvements:

- Remove the dependency on `sleep` (see the source code for notes)
- Add flags to make this script work for other CC apps (perhaps like `--ps`, `--il`, etc)
