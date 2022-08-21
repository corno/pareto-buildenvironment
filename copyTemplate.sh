#!/usr/bin/env bash
rootDirOfProject = $1
dirOfThisScript=`realpath $(dirname "$0")`
cp -R $dirOfThisScript/data/projectTemplate/. $rootDirOfProject/pareto \

#npm messes with .gitignore, that's why I need to handle it separately
cp $dirOfThisScript/data/gitignore $rootDirOfProject/.gitignore \


if [ -d "$rootDirOfProject/pub/" ]
then
    nativeFlag=$(npm --prefix "../pub" pkg get native )
    if [ $nativeFlag != "true" ]
    then
        cp $dirOfThisScript/data/tsconfig.json $rootDirOfProject/pub/
        cp $dirOfThisScript/data/_globals.ts $rootDirOfProject/pub/src/
    fi
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
