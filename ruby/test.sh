#!/bin/bash
workspaceRoot=$(pwd)

docker run --rm -v ${workspaceRoot}:${workspaceRoot} -w ${workspaceRoot} code-katas-ruby rspec **/*_spec.rb
