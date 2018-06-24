#!/bin/bash
workspaceRoot=$(pwd)/01-bowling

docker run --rm -v ${workspaceRoot}:${workspaceRoot} -w ${workspaceRoot} code-katas-java gradle test
