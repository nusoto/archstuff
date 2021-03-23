#!/bin/zsh

cd $HOME/Pictures/ && shotgun "Screenshot ($(($(printf "%s\n" * | grep -E 'Screenshot \([[:digit:]]+\).png' | grep -o -E '[[:digit:]]+' | sort -n -r | head -n1)+1))).png"
