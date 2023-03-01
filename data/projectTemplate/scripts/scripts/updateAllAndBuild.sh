#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#make sure latest buildenvironment is installed
"$scriptDir/updateBuildEnvironment.sh" && \

#update packages and build
"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/prebuild.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"