#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

"$scriptDir/updateNPMProjectDependencies.sh" "$rootDir/typescript/pub" && \
"$scriptDir/updateNPMProjectDependencies.sh" "$rootDir/typescript/test" && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"