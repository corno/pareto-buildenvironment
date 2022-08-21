#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" $rootDir/dev
"$scriptDir/updatePackage.sh" $rootDir/pub
"$scriptDir/updatePackage.sh" $rootDir/test
