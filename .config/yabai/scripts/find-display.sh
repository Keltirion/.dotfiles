#!/bin/bash

tabletSpace=$(yabai -m query --displays | jq --arg v "$1" '.[] | select(.uuid==$v)' | jq '.spaces[0]')

if [ ! -z "$tabletSpace" ]
then
  yabai -m space "$tabletSpace" --label $2
fi
