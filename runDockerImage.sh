#!/bin/bash
set -eu
docker run -it -d --name ev3-development -v ~/ev3sources-xtended-docker/ev3sources:/home/ubuntu/projects ev3-development /bin/bash
