#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/prebuild.sh" && \

"$scriptDir/checkPackageUpdates.sh" pub && \
"$scriptDir/checkPackageUpdates.sh" test && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"