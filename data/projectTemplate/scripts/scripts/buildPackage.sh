#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No path supplied"
    exit 1
fi

projectDir=$1

rootDir=`realpath "$scriptDir/../.."`

if [ -d "$projectDir" ]
then
    rm -rf "$projectDir/dist" && \
    npm exec --prefix "$buildDir" -- tsc -p "$projectDir"
fi