#!/usr/bin/env bash
# Should be run from the project's root.

ctags -R --file-scope=no --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ . 2>/dev/null
