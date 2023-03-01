#!/usr/bin/env bash
scriptsDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$buildDir" && \
npm update --prefix "$buildDir"
"$buildDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$rootDir"
