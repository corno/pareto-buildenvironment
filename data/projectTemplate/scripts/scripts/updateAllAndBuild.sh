#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

#make sure latest buildenvironment is installed
"$scriptDir/updateScripts.sh" && \

#update packages and build
"$scriptDir/updateNPMPackageDependencies.sh" "$rootDir/prebuild" && \
"$scriptDir/updateNPMPackageDependencies.sh" "$rootDir/pareto" && \
"$scriptDir/generateTypescript.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"