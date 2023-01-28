#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
rootName=`basename $root`

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
