#!/bin/bash

player="spotify"
status=$(playerctl -p $player status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    artist=$(playerctl -p $player metadata artist 2>/dev/null)
    title=$(playerctl -p $player metadata title 2>/dev/null)
    
    if [ ${#artist} -gt 15 ]; then
        artist="${artist:0:13}.."
    fi
    if [ ${#title} -gt 20 ]; then
        title="${title:0:18}.."
    fi
    
    if [ "$status" = "Playing" ]; then
        echo "{\"text\": \" $artist - $title\", \"class\": \"\"}"
    else
        echo "{\"text\": \"󰏤 $artist - $title\", \"class\": \"\"}"
    fi
else
    echo "{\"text\": \"\", \"class\": \"\"}"
fi
