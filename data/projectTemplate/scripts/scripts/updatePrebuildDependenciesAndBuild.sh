#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/generateTypescript.sh" && \
"$scriptDir/buildAndTest.sh"
