#!/bin/bash

for arg in "$@"
do
    if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
    then
        echo "${0} path_to_image path_to_audio_file"
        exit
    fi
done

if [ "$#" -ne 2 ]; then
    echo "${0} path_to_image path_to_audio_file"
    exit
fi

ffmpeg -loop 1 -framerate 2 -i $1 -i $2 -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a copy -shortest -pix_fmt yuv420p ${2}.mkv

