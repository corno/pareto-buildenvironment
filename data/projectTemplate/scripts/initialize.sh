#!/usr/bin/env bash

paretoBuildEnvDir=`realpath $(dirname "$0")`

npm install && \
node ./node_modules/npm-updatedependencies2latest/dist/index.js . dependencies && \
"$paretoBuildEnvDir/node_modules/pareto-buildenvironment/initializeProject.sh" "$paretoBuildEnvDir/.."
