#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#make sure latest buildenvironment is installed
"$scriptDir/updateScripts.sh" && \

#update packages and build
"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/generateTypescript.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"