#!/usr/bin/env bash

find . -name '*.pyc' -delete

files=$(git diff --name-only --diff-filter=d master | grep '\.py$' | tr '\n' ' ')

echo "Files: "
echo $files
echo " "

if [[ $files = "" ]] ; then
    exit 0
fi

autoflake --in-place --remove-all-unused-imports --remove-unused-variables -r $files
black -S -l 120 $files
