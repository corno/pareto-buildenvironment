#!/usr/bin/env bash

scriptsDir=`realpath $(dirname "$0")`
paretoBuildEnvDir="$scriptsDir/.."

pushd "$buildDir" > /dev/null && \
npx npm-check-updates -u --packageFile "$paretoBuildEnvDir/package.json" && \
npx npm-safe-install -t "$paretoBuildEnvDir"
popd > /dev/null

"$paretoBuildEnvDir/node_modules/pareto-buildenvironment/initialize.sh" "$paretoBuildEnvDir"
