#!/usr/bin/env bash

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then
    npx npm-check-updates -u --packageFile "$part/package.json" > /dev/null
fi