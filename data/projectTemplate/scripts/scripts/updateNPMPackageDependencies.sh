#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
then
    echo "No npm package path supplied"
    exit 1
fi
npmPackagePath=$1

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"


if [ -d "$npmPackagePath" ]
then
    npx "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$npmPackagePath" "dependencies" && \
    node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$npmPackagePath" "devDependencies" && \
    npm update --prefix $npmPackagePath
fi