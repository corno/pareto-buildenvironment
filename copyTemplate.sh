#!/usr/bin/env bash
dir=`realpath $(dirname "$0")`
cp -R ./data/projectTemplate/. $1/pareto \

#npm messes with .gitignore, that's why I need to handle it separately
cp ./data/gitignore $i/.gitignore \


if [ -d "../pub/" ]
then
    nativeFlag=$(npm --prefix "../pub" pkg get native )
    if [ $nativeFlag != "true" ]
    then
        cp ./data/tsconfig.json $1/pub/
        cp ./data/_globals.ts $1/pub/src/
    fi
fi

parts=("dev" "test")
for part in "${parts[@]}"
do
    if [ -d "../$part/" ]
    then
        cp ./data/tsconfig.json "$1/$part/"
        cp ./data/_globals.ts "$1/$part/src/"
    fi

done

#update this package because the copied package.json contains an old version of pareto-buildenvironment (by design, the template is not updated every time the package is published)
"$dir/updatePackage.sh" pareto
