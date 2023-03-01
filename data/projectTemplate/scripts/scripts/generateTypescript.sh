#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir=`realpath "$scriptDir/../.."`
buildDir="$scriptDir/.."

if [ -d "$rootDir/prebuild" ]
then
    "$scriptDir/buildPrebuildPackage.sh" && \
    pushd "$buildDir" > /dev/null && \
    npx tsc -p "$rootDir/prebuild" && \
    popd > /dev/null && \
    node --enable-source-maps "$rootDir/prebuild/dist/bin/generateCode.generated.js" "$rootDir"
fi && \

rm -rf "$rootDir/tmp/templates" && \

"$scriptDir/buildParetoPackage.sh" && \
pushd "$buildDir" > /dev/null && \
npx tsc -p "$rootDir/pareto" && \
popd > /dev/null && \
node --enable-source-maps "$rootDir/pareto/dist/bin/generateCode.generated.js" "$rootDir"
