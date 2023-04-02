#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

if [ -z "$1" ]
then
    echo "No generation supplied"
    exit 1
fi

generation=$1

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"
pubDir="$rootDir/typescript/pub"

#bump version and store in variable
newVersion=$(npm version "$generation" --prefix $pubDir) && \
echo "version bumped: $generation" && \

#update the dependencies, this alters the package-lock.json slightly
"$scriptDir/updateNPMPackageDependencies.sh" "$pubDir" && \

#commit package.json with new version number
git add --all && \
git commit -m "version bumped to $newVersion" && \

#create a tag
git tag -a "$newVersion" -m "$newVersion" && \

git push && \

#publish
npm publish $pubDir && \

#post process 

"$scriptDir/generateTypescript.sh"
npm install --package-lock-only --prefix $pubDir

git add --all && \
git commit -m "version erased" && \

git push