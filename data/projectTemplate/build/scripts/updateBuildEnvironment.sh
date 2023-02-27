#!/usr/bin/env bash

scriptsDir=`realpath $(dirname "$0")`
buildDir="$scriptsDir/.."

npm-check-updates -u --packageFile "$buildDir/package.json" && \
npm update

"$buildDir/node_modules/pareto-buildenvironment/initialize.sh" "$buildDir"
