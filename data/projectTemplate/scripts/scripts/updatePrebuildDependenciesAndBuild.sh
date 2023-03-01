#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/updateNPMProjectDependencies.sh" $rootDir/prebuild && \
"$scriptDir/buildAndTest.sh"
