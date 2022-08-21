#!/usr/bin/env bash
dir=`realpath $(dirname "$0")`

"$dir/updatePackage.sh" ../dev
"$dir/updatePackage.sh" ../pub
"$dir/updatePackage.sh" ../test
