#!/bin/bash

# This is just a small script I made to easily change a method name in C++ in
# multiple files. There is no guarantee it will work with complex strings.

function replace_seq() {
    for i in *; do
        if [ $i != "change_method_name.sh" ]; then
            sed --in-place s/$1/$2/g $i;
        fi
    done
}

function show_usage() {
    echo 'Usage:'
    echo './change_method_name CHANGED_EXP NEW_EXP'
}

if [ $# -ne 2 ]; then
    show_usage;
    exit 1;
fi

replace_seq $1 $2
