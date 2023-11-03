#!/bin/bash

currentVersion="0.0.0"
#commitMessage=$(git log -1 --pretty=%B)
commitMessage=release:

if [[ $commitMessage =~ ^release: ]]; then
  currentVersion=$(npm version minor)
elif [[ $commitMessage =~ ^minor: ]]; then
  currentVersion=$(npm version patch)
elif [[ $commitMessage =~ ^major: ]]; then
  currentVersion=$(npm version major)
fi

echo "Current Version: $currentVersion"
# # Optionally, you can set this value as an environment variable or use it in further commands.
export NEW_VERSION=$currentVersion

