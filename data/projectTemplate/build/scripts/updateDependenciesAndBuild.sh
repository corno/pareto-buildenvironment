#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" pub && \
"$scriptDir/updatePackage.sh" test && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"