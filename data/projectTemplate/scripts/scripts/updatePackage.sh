#!/usr/bin/env bash

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then    
    # npm outdated --json --prefix "$part" & \ #ignore the exitCode
    npm-check-updates -u --packageFile "$part/package.json" && \
    pushd "$part" > /dev/null && \
    npm update && \
    popd > /dev/null
fi