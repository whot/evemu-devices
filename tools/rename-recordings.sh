#!/bin/bash
#
# Rename a batch of files with random names to use the device name recording
# in the evemu file (i.e. the N: line)
#

set -e

rename() {
    file=$1
    suffix=events
    devname=`grep -m 1 "^N:" "$file" | sed -e "s/^N: //"`

    case "$file" in
        *.event|*.events)
            suffix=events
            ;;
        *.desc | *.device)
            suffix=desc
            ;;
        *)
            suffix=events
            ;;
    esac

    fname="$devname.$suffix"
    if [ -e "$fname" ]; then
        echo "File '$fname' exists already. Skipping."
    else
        cp "$1" "$fname"
        echo "Device file: $fname"
    fi
}

usage() {
    echo "`basename $0` mydev.desc [mydev2.desc ...]"
    echo ""
    echo "Renames (by copying) evemu recordings to use the actual device name."
}

if [ $# -lt 1 ]; then
    usage $0
    exit
fi

case "$1" in 
    -h|--help)
        usage $0
        exit
        ;;
    *)
        ;;
esac

while [ $# -gt 0 ]; do
    file="$1"
    rename "$file"
    shift
done
