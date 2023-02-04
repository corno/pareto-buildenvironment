#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/prebuild.sh" && \
"$scriptDir/buildAndTest.sh"
