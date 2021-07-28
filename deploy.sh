#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f git@github.com:mustafaerk/letgo-with-map-vue.git master:gh-pages

cd -
