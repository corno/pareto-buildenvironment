#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

#make sure latest buildenvironment is installed
"$scriptDir/updateScripts.sh" && \

#update packages and build
"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/updateParetoDependencies.sh" && \
"$scriptDir/generateTypescript.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"