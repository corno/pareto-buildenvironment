#!/usr/bin/env bash

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then    
    pushd "$buildDir" > /dev/null && \
    # npm outdated --json --prefix "$part" & \ #ignore the exitCode
    npx npm-check-updates -u --packageFile "$part/package.json" && \
    npm update --prefix "$part/" && \
    popd > /dev/null
fi