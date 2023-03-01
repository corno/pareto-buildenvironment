#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$buildDir" verbose && \
npm update --prefix "$buildDir"
"$buildDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$rootDir"
