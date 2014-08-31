#!/usr/bin/env bash

# Should be run from the project's root.
# WARNING: Assumes that the scripts are in ~/ctags/scripts/.

DIRTAGS=~/ctags/scripts/dirtags.sh
find * -type d -exec $DIRTAGS {} \;
