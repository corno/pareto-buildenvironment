#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No project type supplied"
fi
npmPackagePath=$1

rootDir=`realpath "$scriptDir/../.."`
buildDir=`realpath "$rootDir/scripts"`


if [ -d "$npmPackagePath" ]
then    
    node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$npmPackagePath" && \
    npm update --prefix $npmPackagePath
fi