#!/bin/bash

if [[ $# < 2 ]]; then
	echo "Usage: ./script.sh source target"
	exit 1
fi

for FILE in $(grep -oP 'func\s+(\([^)]*\)\s*)?\K[A-Z]\w+' $1); do echo "func Test$FILE(t *testing.T){}" >>$2; done
