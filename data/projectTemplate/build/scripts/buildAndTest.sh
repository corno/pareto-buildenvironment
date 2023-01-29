#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/prebuild.sh" && \

"$scriptDir/checkDependencyUpdates.sh" && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"