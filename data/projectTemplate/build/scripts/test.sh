#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; no testing for glossary or core-types"
else
    node $rootDir/test/dist/bin/test.generated.js $rootDir/test/data
fi
