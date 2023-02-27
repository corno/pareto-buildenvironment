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
    pushd "$part" > /dev/null && \
    npm update && \
    popd > /dev/null
    popd > /dev/null
fi