#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

"$scriptDir/generateTypescript.sh" && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"