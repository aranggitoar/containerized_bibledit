#!/bin/bash

# Run the docker instance and bind the exposed ports:
# SSH to 25404 of localhost, SMTP to 19303, HTTP to 4090, POP3 to 110, and
# the rest of arbitrary unassigned ports to its respective counterparts.
sudo docker run -it --name bibledit-cloud \
  -p 25404:22 -p 19303:25 \
  -p 4090:80 -p 19304:110 \
  -p 12070:12070 -p 12071:12071 \
  -p 12080:12080 -p 12081:12081 \
  -p 12090:12090 -p 12091:12091 \
  -p 13070:13070 -p 13071:13071 \
  -p 13080:13080 -p 13081:13081 \
  -p 13090:13090 -p 13091:13091 \
	local/bibledit-cloud bash
