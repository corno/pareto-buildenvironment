#!/usr/bin/env bash
scriptDir=`realpath $(dirname "$0")`

git diff --exit-code && git log origin/master..master --exit-code
