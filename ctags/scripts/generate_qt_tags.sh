#!/usr/bin/env bash

QT_DIR=~/qt5/qtbase/src/
QT_CTAGS_FILE=~/ctags/qt/tags

ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ -f $QT_CTAGS_FILE $QT_DIR 2>/dev/null

if [ -f $QT_CTAGS_FILE ]; then
    echo "Qt ctags successfully generated!"
else
    echo "There were some problems while generating Qt ctags"
fi
