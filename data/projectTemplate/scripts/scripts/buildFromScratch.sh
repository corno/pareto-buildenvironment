#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

"$scriptDir/clean.sh" && \
npm install pareto-buildenvironment --prefix "$buildDir" && \
"$buildDir/initialize.sh" && \
"$scriptDir/updateAllAndBuild.sh"