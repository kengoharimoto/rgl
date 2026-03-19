#!/bin/sh

# use: rgl.sh "PATTERN"
#
# bugs: fixed - now searches ignored files using --no-ignore

rg --no-ignore --pretty "$1" | less -R
