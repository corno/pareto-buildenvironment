#!/usr/bin/env bash
workspaceDir=$1


for f in $workspaceDir/*; do
    cd "$f/build" && \
    "./scripts/updatePackage.sh" "build" && \
    "./node_modules/build-buildenvironment/copyTemplate.sh" "$f"
done