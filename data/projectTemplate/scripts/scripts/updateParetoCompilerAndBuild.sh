#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/initializePareto.sh"
"$scriptDir/updateNPMPackageDependencies.sh" $rootDir/pareto && \
"$scriptDir/buildAndTest.sh"
