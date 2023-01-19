#!/usr/bin/env bash

projectDir=$1

if [ -d "$projectDir" ]
then
    rm -rf "$projectDir/dist" && \
    npx tsc -p "$projectDir"
fi