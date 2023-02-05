#!/usr/bin/env bash

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then
    pushd "$buildDir" > /dev/null && \
    npx npm-check-updates -u --packageFile "$part/package.json" > /dev/null && \
    popd > /dev/null
fi