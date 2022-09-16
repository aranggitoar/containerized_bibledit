# Containerized Bibledit

_WIP. More detail will be added in the future._

This is a setup to develop Bibledit locally in a container running the
latest Debian Linux.

## Usage

Simply run `build.sh` then `run.sh`.

After building the first time, Docker should save the image of the
container, so in the subsequent development session:

1. Start the container `sudo docker start bibledit-cloud`, then
2. Attach to the container `sudo docker attach bibledit-cloud`.

After that, you'll enter the container's shell as root.
