#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

if [ -d "$rootDir/dev" ]
then
    "$scriptDir/buildDevPackage.sh" && \
    npx tsc -p "$rootDir/dev" && \
    node "$rootDir/dev/dist/bin/generateCode.generated.js" ../..
fi && \

rm -rf "$rootDir/tmp/templates" && \

"$scriptDir/buildParetoPackage.sh" && \
npx tsc -p "$rootDir/pareto" && \
node "$rootDir/pareto/dist/bin/generateCode.generated.js" ../.. && \

"$scriptDir/checkPackageUpdates.sh" "pub" && \
"$scriptDir/checkPackageUpdates.sh" "test"
