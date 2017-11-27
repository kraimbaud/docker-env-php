#!/usr/bin/env bash

file='docker.env'

if [ -a $file ]; then
    echo "$file file exists."
else
    cp docker.env.dist $file
    echo "$file file has been created"
fi
