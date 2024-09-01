#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir=`realpath "$scriptDir/../.."`

rm -rf "$rootDir/.gitignore" && \
rm -rf "$rootDir/tmp" && \

rm -rf "$rootDir/prebuild/dist" && \
rm -rf "$rootDir/prebuild/package-lock.json" && \
rm -rf "$rootDir/prebuild/node_modules" && \

rm -rf "$rootDir/pareto/dist" && \
rm -rf "$rootDir/pareto/package-lock.json" && \
rm -rf "$rootDir/pareto/node_modules" && \
#find "$rootDir/pareto/src" -name "*.generated.ts" -exec rm {} \; && \

rm -rf "$rootDir/typescript/pub/dist" && \
rm -rf "$rootDir/typescript/pub/node_modules" && \
rm -rf "$rootDir/typescript/pub/package.json" && \
rm -rf "$rootDir/typescript/pub/package-lock.json" && \
rm -rf "$rootDir/typescript/pub/tsconfig.json" && \

rm -rf "$rootDir/typescript/test/dist" && \
rm -rf "$rootDir/typescript/test/node_modules" && \
rm -rf "$rootDir/typescript/test/package.json" && \
rm -rf "$rootDir/typescript/test/package-lock.json" && \

if [ -d "$rootDir/typescript" ]
then
    find "$rootDir/typescript" -name "index.ts" -delete && \
    find "$rootDir/typescript" -name "*.generated.ts" -delete
fi
