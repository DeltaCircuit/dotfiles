#!/bin/bash

lsof /dev/video0 > /dev/null 2>&1

if [ "$?" -eq 1 ]
then
    echo '{}'
else 
    echo "{\"text\": \" 󰞮 \" }"
fi