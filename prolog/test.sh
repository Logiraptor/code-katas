#!/bin/bash
workspaceRoot=$(pwd)

docker run --rm -v ${workspaceRoot}:${workspaceRoot} -w ${workspaceRoot} code-katas-prolog swipl --quiet -f 01-bowling/spec.pl -t main || echo "Fail"
