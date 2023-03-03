#!/opt/homebrew/bin/bash

declare -A home
home["display_1_id"]="277AC0CC-F1A4-4F80-9EE2-7A53F66272F9"
home["display_2_id"]="1DD062C5-B06F-41D4-9DCC-381B8DC7CB89"
home["display_3_id"]="F52C6D8C-F585-4671-BC82-9A24B98C04F4"

declare -A laptop

display_number=$(yabai -m query --displays | jq '.[]' | jq .uuid | wc -l)

if [[ $display_number -eq 1 ]]
then
elif [[ $display_number -eq 3 ]]
then
    printf '{"name":"home", "displays":{"display_1":"%s", "display_2":"%s", "display_3":"%s"}}\n' ${home["display_1_id"]} ${home["display_2_id"]} ${home["display_3_id"]}
else
    echo "Nie wiem gdzie jestem"
fi