#!/usr/bin/env bash

paretoBuildEnvDir=`realpath $(dirname "$0")`

npm install && \
npx update2latest $paretoBuildEnvDir dependencies && \
"$paretoBuildEnvDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$paretoBuildEnvDir/.."
