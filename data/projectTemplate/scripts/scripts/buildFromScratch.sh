#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

#change to a directory that will not be deleted
cd $rootDir && \
pushd $rootDir && \

"$scriptDir/clean.sh" && \
npm install pareto-buildenvironment --prefix "$buildDir" && \
"$buildDir/initialize.sh" && \
"$scriptDir/updateAllAndBuild.sh"