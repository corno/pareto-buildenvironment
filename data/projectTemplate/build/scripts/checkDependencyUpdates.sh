#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/checkPackageUpdates.sh" dev
"$scriptDir/checkPackageUpdates.sh" pareto
"$scriptDir/checkPackageUpdates.sh" pub
"$scriptDir/checkPackageUpdates.sh" test
