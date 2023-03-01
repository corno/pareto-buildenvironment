#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No project type supplied"
fi

projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

part="$rootDir/$projectType"

if [ -d "$part" ]
then
    npm-check-updates -u --packageFile "$part/package.json" > /dev/null && \
fi