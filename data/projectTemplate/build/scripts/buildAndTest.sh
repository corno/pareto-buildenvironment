#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/prebuild.sh" && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"