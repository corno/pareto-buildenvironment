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


"$scriptDir/buildParetpPackage.sh" && \
npx tsc -p "$rootDir/pareto" && \
node "$rootDir/pareto/dist/bin/generateCode.generated.js" ../..

$scriptDir/buildPubAndTestPackages.sh && \
if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; no testing for glossary or core-types"
else
    node $rootDir/test/dist/bin/test.generated.js $rootDir/test/data
fi
