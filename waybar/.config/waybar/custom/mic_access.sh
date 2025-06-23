#!/bin/bash



readarray -t media_names < <(pactl -f json list source-outputs | jq -r '.[].properties["media.name"]')

apps=${#media_names[@]}

if [ $apps -gt 0 ]
then
    tooltip=""
    for item in "${media_names[@]}"; do
        tooltip+=" $item"$'\r'
    done      
    echo "{\"text\": \" 󰢴 \", \"tooltip\": \"$tooltip\" }"
else
    echo '{}'
fi


