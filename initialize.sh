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

if [ -d "$rootDirOfProject/dev/" ]
then
    cp $dirOfThisScript/data/tsconfig.json "$rootDirOfProject/dev/"
    cp $dirOfThisScript/data/_globals.ts "$rootDirOfProject/dev/src/"
fi

if [[ $rootName == res-* || $rootName == pareto-core-* ]]
then
    echo "$rootName; not copying typescript files to pub"
else
    echo "$rootName; copying typescript files to pub"

    cp $dirOfThisScript/data/tsconfig.json $rootDirOfProject/pub/
    cp $dirOfThisScript/data/_globals.ts $rootDirOfProject/pub/src/
fi

if [[ $rootName == glo-* || $rootName == pareto-core-types ]]
then
    echo "$rootName; not copying test files"
else
    cp $dirOfThisScript/data/tsconfig.json "$rootDirOfProject/test/"
    cp $dirOfThisScript/data/_globals.ts "$rootDirOfProject/test/src/"
    cp $dirOfThisScript/data/test.generated.p.ts "$rootDirOfProject/test/src/bin/"
fi
