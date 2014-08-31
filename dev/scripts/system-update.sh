#!/bin/bash

/usr/bin/apt-get clean && \
/usr/bin/apt-get autoclean && \
/usr/bin/apt-get -y autoremove && \
/usr/bin/apt-get update && \
/usr/bin/apt-get -y upgrade && \
/usr/bin/apt-get -y dist-upgrade && \
/usr/bin/apt-get clean && \
/usr/bin/apt-get autoclean && \
/usr/bin/apt-get -y autoremove
