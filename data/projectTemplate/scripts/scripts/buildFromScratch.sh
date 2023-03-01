#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir=`realpath "$rootDir/scripts"`

"$scriptDir/clean.sh" && \
npm install --prefix "$buildDir" && \
"$buildDir/initialize.sh" && \
"$scriptDir/updateAllAndBuild.sh"