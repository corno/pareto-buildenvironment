#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"

"$scriptDir/cleanExceptScripts.sh" && \
"$buildDir/initialize.sh" && \
#"$buildDir/node_modules/pareto-buildenvironment/initializeProject.sh $rootDir" && \
#"$scriptDir/initalizePareto.sh" && \
"$scriptDir/updateAllAndBuild.sh"