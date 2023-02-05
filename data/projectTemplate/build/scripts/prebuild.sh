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
    node "$rootDir/dev/dist/bin/generateCode.generated.js" "$rootDir"
fi && \

rm -rf "$rootDir/tmp/templates" && \

"$scriptDir/buildParetoPackage.sh" && \
pushd "$buildDir" > /dev/null && \
npx tsc -p "$rootDir/pareto" && \
popd > /dev/null && \
node "$rootDir/pareto/dist/bin/generateCode.generated.js" "$rootDir" && \

"$scriptDir/checkPackageUpdates.sh" "pub" && \
"$scriptDir/checkPackageUpdates.sh" "test"
