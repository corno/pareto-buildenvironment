#!/usr/bin/env bash
dir=`realpath $(dirname "$0")`

$dir/analyseTypeScriptProject.sh ../pub/tsconfig.json && \
$dir/analyseTypeScriptProject.sh ../test/tsconfig.json