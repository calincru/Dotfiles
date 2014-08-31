#!/usr/bin/env bash

cd $1
ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ *
