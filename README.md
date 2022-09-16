# Containerized Bibledit

_WIP. More detail will be added in the future._

This is a setup to develop Bibledit locally in a container running the
latest Debian Linux.

## Usage

Simply run `build.sh` then `run.sh`.

After building the first time, Docker should save the image of the
container with the name `bibledit-cloud`, so in the subsequent development
session:

1. Start the container `sudo docker start bibledit-cloud`, then
2. Attach to the container `sudo docker attach bibledit-cloud`.

After that, you'll enter the container's shell as root.

## Other Important Commands

### Copying something to the container

> `sudo docker cp $PATHTOFILE bibledit-cloud:$PATHTOFILE`

Example, inside the root of the Bibledit Cloud repo:

`sudo docker cp demo/logic.cpp bibledit-cloud:/root/12070/demo/logic.cpp`

### Copying something from the container

> `sudo docker cp bibledit-cloud:$PATHTOFILE $PATHTOFILE`

Example, inside the root of the Bibledit Cloud repo:

`sudo docker cp bibledit-cloud:/root/12070/demo/logic.cpp demo/logic.cpp`

### Running a command in the container from your machine

> `sudo docker exec bibledit-cloud $COMMAND`

Example, listing the contents of `/root` directory:

`sudo docker exec bibledit-cloud ls /root`
