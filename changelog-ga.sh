#!/bin/bash
set -x

: ${AUTO_CHANGELOG_CONFIG:=".changelog.toml"}
: ${CHANGELOG_FILE:="CHANGELOG-GA.md"}

# get current major, minor digits
version_tag=$(cat version.txt)
CURRENT_MAJOR=$(echo "$version_tag" | cut -d '.' -f 1)
CURRENT_MINOR=$(echo "$version_tag" | cut -d '.' -f 2)

GIT_CLIFF__GIT__TAG_PATTERN="v${CURRENT_MAJOR}.${CURRENT_MINOR}.[0-9]" \
    git cliff --config "$AUTO_CHANGELOG_CONFIG" --tag "v$version_tag" --prepend "$CHANGELOG_FILE" --unreleased