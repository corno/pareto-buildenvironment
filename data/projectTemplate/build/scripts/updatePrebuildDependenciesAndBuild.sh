#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" dev && \
"$scriptDir/updatePackage.sh" pareto && \

"$scriptDir/prebuild.sh" && \

"$scriptDir/buildAndTest.sh"
