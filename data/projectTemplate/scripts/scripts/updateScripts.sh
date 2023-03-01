#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

"$scriptDir/updateNPMPackageDependencies.sh" $buildDir && \
"$buildDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$rootDir"
