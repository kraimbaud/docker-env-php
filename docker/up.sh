#!/usr/bin/env bash

file='.env'

if [ -a $file ]; then
    echo "$file file exists."
else
    cp .env.dist $file
    echo "$file file has been created"
fi
