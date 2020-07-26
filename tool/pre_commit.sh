#!/bin/sh

pre_commit_flutter() {
  echo "\nRunning pre-commit script for Flutter in $1\n"
  pushd $1
  echo "Running flutter format..."
  flutter format --line-length 80 --set-exit-if-changed .
  echo "Running flutter analyze..."
  flutter analyze
  popd
  echo "\nDone\n"
}

pre_commit_flutter "."

if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory clean."
  exit 0
else
  echo "! Uncommitted changes detected. Please push the new changes to this branch."
  exit 1
fi
