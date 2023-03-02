#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

rootDir=`realpath "$scriptDir/../.."`

cp -RT ../node_modules/pareto-buildenvironment/data/pareto $rootDir/pareto