#!/opt/homebrew/bin/bash

setup_name=$(jq --raw-output '.name' <<< $1)

if [ $? -eq 0 ]
then
    if [ "$setup_name" = "home" ]
    then
        yabai -m space --create
        yabai -m space 1 --label terminal
        yabai -m space --create 
        yabai -m space 2 --label code
        yabai -m space --create 
        yabai -m space 3 --label remote
        yabai -m space --create 
        yabai -m space 4 --label web
        yabai -m space --create 
        yabai -m space 5 --label comms
        yabai -m space --create 
        yabai -m space 6 --label mail
    fi
else
    echo "There is no property named 'name' in '$1'"
    exit 1
fi
