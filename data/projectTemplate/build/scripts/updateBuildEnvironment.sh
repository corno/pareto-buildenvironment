#!/usr/bin/env bash

scriptsDir=`realpath $(dirname "$0")`
buildDir="$scriptsDir/.."

pushd "$buildDir" > /dev/null && \
npx npm-check-updates -u --packageFile "$buildDir/package.json" && \
npx npm-safe-install -t "$buildDir"
popd > /dev/null

"$buildDir/node_modules/pareto-buildenvironment/initialize.sh" "$buildDir"
