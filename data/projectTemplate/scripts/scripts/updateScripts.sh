#!/usr/bin/env bash

scriptsDir=`realpath $(dirname "$0")`
buildDir="$scriptsDir/.."

node "$buildDir/node_modules/npm-updatedependencies2latest/dist/index.js" "$buildDir" && \
npm update
"$buildDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$buildDir/.."
