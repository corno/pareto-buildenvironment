#!/usr/bin/env bash
rootDirOfProject=$1

echo "copying to $rootDirOfProject"
dirOfThisScript=`realpath $(dirname "$0")`
rm -rf $rootDirOfProject/pareto/scripts/*
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject \

#npm messes with .gitignore, that's why I need to handle it separately
cp $dirOfThisScript/data/gitignore $rootDirOfProject/.gitignore \



root="`cd "$rootDirOfProject";pwd`" # the resolved path to the root dir of the project
rootName=`basename $root`

if [[ $rootName == rsi-* || $rootName == pareto-core-* ]]
then
    echo "$rootName; not copying typescript files to pub"
else
    echo "$rootName; copying typescript files to pub"

    cp $dirOfThisScript/data/tsconfig.json $rootDirOfProject/pub/
    cp $dirOfThisScript/data/_globals.ts $rootDirOfProject/pub/src/
fi

parts=("dev" "test")
for part in "${parts[@]}"
do
    if [ -d "$rootDirOfProject/$part/" ]
    then
        cp $dirOfThisScript/data/tsconfig.json "$rootDirOfProject/$part/"
        cp $dirOfThisScript/data/_globals.ts "$rootDirOfProject/$part/src/"
    fi

done
