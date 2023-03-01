#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/updateNPMProjectDependencies.sh" $rootDir/pareto && \
"$scriptDir/buildAndTest.sh"
