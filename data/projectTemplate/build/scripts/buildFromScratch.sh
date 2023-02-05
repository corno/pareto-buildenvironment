#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/clean.sh" && \

pushd "$rootDir/build" > /dev/null && \
npm install && \
"./initialize.sh" && \
popd > /dev/null && \

#make sure latest buildenvironment is installed
"$scriptDir/updateBuildEnvironment.sh" && \

#update packages and build
"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/prebuild.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"