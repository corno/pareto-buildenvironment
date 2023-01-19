#!/usr/bin/env bash
paretoBuildEnvDir=$1
rootDirOfProject="$1/.."

echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/build/scripts/*
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject \



root="`cd "$rootDirOfProject";pwd`" # the resolved path to the root dir of the project
rootName=`basename $root`

devDir="$rootDirOfProject/dev/"
paretoDir="$rootDirOfProject/pareto/"
pubDir="$rootDirOfProject/pub/"
testDir="$rootDirOfProject/test/"


#dev
if [ -d $devDir ]
then
    npm --prefix "$devDir" install pareto-core-exe@latest
    npm --prefix "$devDir" install pareto-core-lib@latest
    npm --prefix "$devDir" install pareto-core-raw@latest
    npm --prefix "$devDir" install pareto-core-state@latest
fi

#pareto
if [ -d $paretoDir ]
then
    npm --prefix "$paretoDir" install pareto-core-exe@latest
    npm --prefix "$paretoDir" install pareto-core-lib@latest
    npm --prefix "$paretoDir" install pareto-core-raw@latest
    npm --prefix "$paretoDir" install pareto-core-state@latest
fi


#pub
if [[ $rootName == exe-* ]]
then
    npm --prefix "$pubDir" install pareto-core-exe@latest
fi
if [[ $rootName == lib-* || $rootName == exe-* ]]
then
    npm --prefix "$pubDir" install pareto-core-lib@latest
    npm --prefix "$pubDir" install pareto-core-raw@latest
    npm --prefix "$pubDir" install pareto-core-state@latest
fi

if [[ $rootName == res-* ]]
then
    npm --prefix "$pubDir" install pareto-core-internals@latest
fi


#test
if [[ $rootName == res-* || $rootName == lib-* || $rootName == exe-* ]]
then
    npm --prefix "$testDir" install pareto-core-exe@latest
    npm --prefix "$testDir" install pareto-core-lib@latest
    npm --prefix "$testDir" install pareto-core-raw@latest
    npm --prefix "$testDir" install pareto-core-state@latest
    npm --prefix "$testDir" install lib-pareto-test@latest
fi
