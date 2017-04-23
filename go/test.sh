#!/bin/bash
workspaceRoot=$(pwd)

docker run --rm -v ${workspaceRoot}:${workspaceRoot} -w ${workspaceRoot} code-katas-go go test ./...
