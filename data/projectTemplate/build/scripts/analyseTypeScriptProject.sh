#!/usr/bin/env bash

projectDir=$1

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."


if [ -d "$projectDir" ]
then
    node $rootDir/build/node_modules/pareto-ts-validator-bin/dist/bin/analyseTypeScriptProject.js "$projectDir" > /dev/null #only want the errors
fi && \

