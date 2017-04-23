#!/bin/bash
set -e
for f in */
do
    if [[ -d $f ]]; then
        pushd $f
        ./test.sh
        popd
    fi
done