#!/bin/bash

jupyter-nbconvert --to slides $1.ipynb
mv $1.slides.html  index.html
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "new version"
git push origin main gh-pages
git checkout main
rm -rf /tmp/workspace
