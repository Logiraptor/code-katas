#!/bin/bash
for f in */
do
    if [[ -d $f ]]; then
        pushd $f
        ./build.sh
        popd
    fi
done