#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

rootName=`basename $rootDir`

if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; no testing for glossary or core-types"
else
    node --enable-source-maps $rootDir/typescript/test/dist/bin/test.generated.js $rootDir/typescript/test/data
fi
