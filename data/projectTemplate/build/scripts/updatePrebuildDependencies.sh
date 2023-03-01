#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" prebuild && \
"$scriptDir/updatePackage.sh" pareto