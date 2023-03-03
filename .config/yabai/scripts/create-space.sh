#!/opt/homebrew/bin/bash

while getopts 'd:l:i:' flag
do
    case "$flag" in
        d) 
            display="$OPTARG"
            ;;
        l) 
            label="$OPTARG"
            ;;
        i) 
            index="$OPTARG"
            ;;
    esac
done

space_exists=$(yabai -m query --spaces --space $label 2>&1)
space_label=$(yabai -m query --spaces --space $label | jq --raw-output .label 2>&1)
space_display=$(yabai -m query --spaces --space $label | jq .display 2>&1)

echo "Display: $display"
echo "Label: $label"
echo "Index: $index"

echo $space_exists
echo $space_label
echo $space_display

if [ "$space_exists" = "value '$label' is not a valid option for SPACE_SEL" ]
then
    echo "Brak pulpitu"
    yabai -m space --display $display --create
    yabai -m space $(yabai -m query --spaces --display $display | jq '.[-1]' | jq .index) --label $label
    yabai -m space $label --display $display
    echo "Dodano nowy pulpit"
    exit 0
elif [[ $space_display -lt $index ]] || [[ $space_display -gt $index ]]
then
    echo "Pulpit na innym ekranie"
    if [ "$space_label" = "$label" ]
    then
        echo "Pulpil juz istnieje, aborting"
        exit 0
    else
        yabai -m space --create
        yabai -m space $(yabai -m query --spaces --display 1 | jq '.[-1]' | jq .index) --label $label
        yabai -m space $label --display $display
        echo "Dodano nowy pulpit"
        exit 0
    fi
elif [ -z "$space_label" ] 
then
    echo "Pulpit istnieje, label"
    yabai -m space $index --label $label
    yabai -m space $index --display $display
    exit 0
fi
