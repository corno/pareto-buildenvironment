#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`


name=`basename $rootDir` && \
npm pkg set name="$name" --prefix $rootDir/typescript/pub && \

"$scriptDir/updateNPMPackageDependencies.sh" "$rootDir/typescript/pub" && \
"$scriptDir/updateNPMPackageDependencies.sh" "$rootDir/typescript/test" && \

"$scriptDir/buildPubAndTestPackages.sh" && \

"$scriptDir/test.sh"