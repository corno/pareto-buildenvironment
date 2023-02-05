#!/usr/bin/env bash

projectDir=$1

scriptDir=`realpath $(dirname "$0")`
buildDir="$scriptDir/.."

if [ -d "$projectDir" ]
then
    rm -rf "$projectDir/dist" && \
    pushd "$buildDir" > /dev/null && \
    npx tsc -p "$projectDir" && \
    popd > /dev/null
fi