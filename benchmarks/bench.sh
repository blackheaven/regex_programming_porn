#!/usr/local/bin/bash

cd $1
echo "$1,$('./launch.sh' memory $3 $4),$('./launch.sh' benchmark $2 $3 $4 $5)"
