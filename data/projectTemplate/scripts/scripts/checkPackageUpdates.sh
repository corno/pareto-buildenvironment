#!/usr/bin/env bash

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then
    npm-check-updates -u --packageFile "$part/package.json" > /dev/null && \
fi