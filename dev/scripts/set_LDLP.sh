#!/bin/bash

# Be aware that this script should be run from the ./bin directory from a
# build directory. Also, the only thing which is supposed true is that if
# a build uses qt5, then the root directory's name ends with "-qt5".

QT5_LIB_DIR="/home/calin/qt5/qtbase/lib"
LIB_SUFFIX="/lib"
LIB64_SUFFIX="/lib64"
LAST_DIR="$(pwd | rev | cut -d'/' -f1 | rev)"
BUILD_DIR_ROOT="$(pwd | rev | cut -d'/' -f2- | rev)"

if [ -d $BUILD_DIR_ROOT$LIB64_SUFFIX ]; then
    BUILD_LIB=$BUILD_DIR_ROOT$LIB64_SUFFIX
elif [ -d $BUILD_DIR_ROOT$LIB_SUFFIX ]; then
    BUILD_LIB=$BUILD_DIR_ROOT$LIB_SUFFIX
fi

if [ -z BUILD_LIB -o $LAST_DIR != "bin" ]; then
    echo "You are not in the bin directory from within a build directory";
    exit 1;
fi

QT5_BUILD="$(pwd | rev | cut -d'/' -f2- | cut -d'-' -f1 | rev)"
if [ $QT5_BUILD = "qt5" ]; then
    export LD_LIBRARY_PATH=$QT5_LIB_DIR:$BUILD_LIB
else
    export LD_LIBRARY_PATH=$BUILD_LIB
fi

echo "LD_LIBRARY_PATH has been successfully set!"
