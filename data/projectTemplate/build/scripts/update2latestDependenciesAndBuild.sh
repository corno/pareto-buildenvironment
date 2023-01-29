#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/updatePackage.sh" dev && \
"$scriptDir/updatePackage.sh" pareto && \

"$scriptDir/prebuild.sh" && \

"$scriptDir/updatePackage.sh" pub && \
"$scriptDir/updatePackage.sh" test && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"