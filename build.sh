#!/bin/bash

# Set execute permissions for the script
chmod +x "$BASH_SOURCE"

# Reset permissions for build_and_run.sh and execute it with sudo
git checkout -- build_and_run.sh
chmod +x build_and_run.sh
sudo ./build_and_run.sh
