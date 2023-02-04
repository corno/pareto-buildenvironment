#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" dev && \
"$scriptDir/updatePackage.sh" pareto