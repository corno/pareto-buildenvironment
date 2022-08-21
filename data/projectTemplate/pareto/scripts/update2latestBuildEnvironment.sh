#!/usr/bin/env bash
dir=`realpath $(dirname "$0")`

"$dir/updatePackage.sh" pareto

"$dir/../node_modules/pareto-buildenvironment/copyTemplate.sh" "$dir/../../"
