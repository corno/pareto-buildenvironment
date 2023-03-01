#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`
buildDir="$rootDir/scripts"
prebuildDir="$rootDir/prebuild"

if [ -d $prebuildDir ]
then
    "$scriptDir/buildPackage.sh" "$prebuildDir" && \
    npm exec --prefix $buildDir -- tsc -p "$rootDir/prebuild" && \
    node --enable-source-maps "$rootDir/prebuild/dist/bin/generateCode.generated.js" "$rootDir"
fi && \

rm -rf "$rootDir/tmp/templates" && \

"$scriptDir/buildPackage.sh" "$rootDir/pareto" && \
npm exec --prefix $buildDir -- tsc -p "$rootDir/pareto" && \
node --enable-source-maps "$rootDir/pareto/dist/bin/generateCode.generated.js" "$rootDir"
