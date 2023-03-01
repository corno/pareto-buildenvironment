#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
  then
    echo "No project type supplied"
fi
npmProjectPath=$1

rootDir=`realpath "$scriptDir/../.."`
buildDir=`realpath "$rootDir/scripts"`


if [ -d "$part" ]
then    
    # npm outdated --json --prefix "$part" & \ #ignore the exitCode
    node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$npmProjectPath" && \
    npm update --prefix $npmProjectPath
fi