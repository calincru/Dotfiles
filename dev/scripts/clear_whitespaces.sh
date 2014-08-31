#!/bin/bash

# Clears trailing whitespaces in all files from current directory.
# Don't forget about <leader>s in Vi!

find . -type f -name '*.{c,cpp,h}' -exec sed --in-place 's/[[:space:]]\+$//' {} \+
