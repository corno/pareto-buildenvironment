#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No project type supplied"
fi


projectType=$1

scriptDir=`realpath $(dirname "$0")`
rootDir=`realpath "$scriptDir/../.."`
buildDir=`realpath "$scriptDir/.."`

part="$rootDir/$projectType"

if [ -d "$part" ]
then    
    # npm outdated --json --prefix "$part" & \ #ignore the exitCode
    node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$part" && \
    pushd "$part" > /dev/null && \
    npm update && \
    popd > /dev/null
fi