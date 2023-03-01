#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/updateNPMPackageDependencies.sh" $rootDir/prebuild && \
"$scriptDir/buildAndTest.sh"
