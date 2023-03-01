#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

"$scriptDir/clean.sh" && \
npm install --prefix "$buildDir" && \
"$buildDir/initialize.sh" && \
"$scriptDir/updateAllAndBuild.sh"