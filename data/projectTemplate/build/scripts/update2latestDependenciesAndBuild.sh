#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/update2latestDependencies.sh"

"$scriptDir/buildAndTest.sh"
