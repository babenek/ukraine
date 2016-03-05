#!/bin/bash

for file in `find . -regextype posix-extended -regex '.*\.(txt|html)'`; do
    sha256sum --binary "$file" > "$file.sha256"
done

find . -regex '.*\.sha256' -exec cat {} \; | sort > files.sha256.list
