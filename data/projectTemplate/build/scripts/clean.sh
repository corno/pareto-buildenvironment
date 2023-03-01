#!/usr/bin/env bash

scriptDir=`realpath $(dirname "$0")`
rootDir="$scriptDir/../.."

rm -rf $rootDir/.gitignore && \
rm -rf $rootDir/tmp && \

rm -rf $rootDir/prebuild/dist && \
rm -rf $rootDir/prebuild/package-lock.json && \
rm -rf $rootDir/prebuild/node_modules && \

rm -rf $rootDir/pareto/dist && \
rm -rf $rootDir/pareto/package-lock.json && \
rm -rf $rootDir/pareto/node_modules && \

rm -rf $rootDir/typescript/pub/dist && \
rm -rf $rootDir/typescript/pub/node_modules && \
rm -rf $rootDir/typescript/pub/package.json && \
rm -rf $rootDir/typescript/pub/package-lock.json && \
rm -rf $rootDir/typescript/pub/tsconfig.json && \
pushd "$rootDir/typescript/pub" > /dev/null && \
find ./src -name "index.ts" -exec rm {} \; && \
find ./src -name "*.generated.ts" -exec rm {} \; && \
popd > /dev/null && \


rm -rf $rootDir/typescript/test/dist && \
rm -rf $rootDir/typescript/test/node_modules && \
rm -rf $rootDir/typescript/pub/package.json && \
rm -rf $rootDir/typescript/pub/package-lock.json && \
rm -rf $rootDir/typescript/pub/tsconfig.json && \

rm -rf $rootDir/scripts/node_modules && \
rm -rf $rootDir/scripts/package-lock.json && \
rm -rf $rootDir/scripts/scripts