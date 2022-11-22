#!/usr/bin/env bash
paretoBuildEnvDir=$1
rootDirOfProject="$1/.."

echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/pareto/scripts/*
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject \

#npm messes with .gitignore, that's why I need to handle it separately
cp $dirOfThisScript/data/gitignore $rootDirOfProject/.gitignore \



root="`cd "$rootDirOfProject";pwd`" # the resolved path to the root dir of the project
rootName=`basename $root`

devDir="$rootDirOfProject/dev/"
pubDir="$rootDirOfProject/pub/"
testDir="$rootDirOfProject/test/"



if [ -d $devDir ]
then
    cp $dirOfThisScript/data/tsconfig.json "$devDir"
    cp $dirOfThisScript/data/_globals.ts "$devDir/src/"
    npm --prefix "$devDir" install pareto-core@latest
fi

if [[ $rootName == res-* || $rootName == pareto-core-* ]]
then
    echo "$rootName; not copying typescript files to pub"
else
    echo "$rootName; copying typescript files to pub"

    cp $dirOfThisScript/data/tsconfig.json "$pubDir"
    cp $dirOfThisScript/data/_globals.ts "$pubDir/src/"
    npm --prefix "$pubDir" install pareto-core@latest
fi

if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; not copying test files"
else
    cp $dirOfThisScript/data/tsconfig.json "$testDir/"
    cp $dirOfThisScript/data/_globals.ts "$testDir/src/"
    cp $dirOfThisScript/data/test.generated.p.ts "$testDir/src/bin/"
    npm --prefix "$testDir" install pareto-core@latest
fi
