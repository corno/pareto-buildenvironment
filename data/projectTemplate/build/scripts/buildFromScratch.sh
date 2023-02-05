#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#this must be done before the clean command
pushd "$rootDir/build" > /dev/null && \

"$scriptDir/clean.sh" && \

npm install && \
"./initialize.sh" && \
popd > /dev/null && \

#make sure latest buildenvironment is installed
"$scriptDir/updateBuildEnvironment.sh" && \

#update packages and build
"$scriptDir/updatePrebuildDependencies.sh" && \
"$scriptDir/prebuild.sh" && \
"$scriptDir/updateDependenciesAndBuild.sh"