#!/usr/bin/env bash

scriptsDir=`realpath $(dirname "$0")`
paretoBuildEnvDir="$scriptsDir/.."

npx npm-check-updates -u --packageFile "$paretoBuildEnvDir/package.json" && \
npx npm-safe-install -t "$paretoBuildEnvDir"

"$paretoBuildEnvDir/node_modules/pareto-buildenvironment/initialize.sh" "$paretoBuildEnvDir"
