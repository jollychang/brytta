#!/bin/bash
DIR="$1"
find "$DIR" -name "*.flac" -print0 | while read -d $'\0' a; do
flac -d "$a" 
done

find "$DIR" -iname "*.wav" -exec mv {} ~/burn \;
