#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

root="`cd "$rootDir";pwd`" # the resolved path to the root dir of the project
rootName=`basename $root`

if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; no testing for glossary or core-types"
else
    node --enable-source-maps $rootDir/test/dist/bin/test.generated.js $rootDir/test/data
fi
