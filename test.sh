#!/bin/bash
echo "Checkout a language branch first :)"
echo "Available Languages: "
git branch | grep -v master
