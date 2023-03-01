#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" typescript/test && \
"$scriptDir/updatePackage.sh" typescript/test && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"