#!/bin/bash
workspaceRoot=$(pwd)

docker run --rm -v ${workspaceRoot}:${workspaceRoot} -w ${workspaceRoot} code-katas-idris idris --total -o output 01-bowling/UnitTestsAsTypes.idr
