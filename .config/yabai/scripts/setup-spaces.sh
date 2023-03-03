#!/bin/bash

last_space=$(yabai -m query --spaces | jq '.[-1]' | jq .index)

# for space in {5..$last_spaces}
# do
#     echo "i would create space: $space"
# done

for (( space=$last_space+1; space<=$last_space+5; space++))
do
    echo $space
    yabai -m space --create
done