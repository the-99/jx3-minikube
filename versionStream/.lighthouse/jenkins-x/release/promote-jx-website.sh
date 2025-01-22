#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

git clone https://github.com/jenkins-x/jx-docs.git

cd jx-docs
sed -i "s/release = \".*\"/release = \"${JX_VERSION}\"/" config.toml
if git commit -a -m "chore: upgrade jx version"
then
  git push
fi
