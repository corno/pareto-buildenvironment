#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

#this must be done before the clean command
pushd "$rootDir/build" > /dev/null && \

"$scriptDir/clean.sh" && \

npm install && \
"./initialize.sh"
popd > /dev/null && \

"$scriptDir/updateAllAndBuild.sh"