#!/bin/bash

cd build

for file in archlinux*; do
    mv "$file" "fzt-repo${file#archlinux}"
done
