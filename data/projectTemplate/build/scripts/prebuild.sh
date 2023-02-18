#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."
buildDir="$scriptDir/.."

if [ -d "$rootDir/dev" ]
then
    "$scriptDir/buildDevPackage.sh" && \
    pushd "$buildDir" > /dev/null && \
    npx tsc -p "$rootDir/dev" && \
    popd > /dev/null && \
    node --enable-source-maps "$rootDir/dev/dist/bin/generateCode.generated.js" "$rootDir"
fi && \

rm -rf "$rootDir/tmp/templates" && \

"$scriptDir/buildParetoPackage.sh" && \
pushd "$buildDir" > /dev/null && \
npx tsc -p "$rootDir/pareto" && \
popd > /dev/null && \
node --enable-source-maps "$rootDir/pareto/dist/bin/generateCode.generated.js" "$rootDir"
