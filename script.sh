#!/bin/bash

filename=$2

if [ -e "$filename.json" ]; then
        jq '.users[] | select(.id == 1) | .id' "$filename.json"

else
        curl -s "$1" | jq . > "$filename.json"
        jq '.users[] | select(.id == 1) | .id' "$filename.json"
fi