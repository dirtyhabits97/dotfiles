#!/usr/bin/env bash

DRY_RUN=false
MAIN_BRANCH=main

while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--dry-run)
      DRY_RUN=true
      ;;
    -b|--main-branch)
      MAIN_BRANCH="$2"
      shift
      ;;
  esac
  shift
done

git checkout -q "$MAIN_BRANCH"
# source: https://stackoverflow.com/a/56026209
git for-each-ref refs/heads/ "--format=%(refname:short)" | while read -r branch;  do

  mergeBase=$(git merge-base "$MAIN_BRANCH" "$branch") 
  if [[ $(git cherry "$MAIN_BRANCH" "$(git commit-tree "$(git rev-parse "$branch^{tree}")" -p "$mergeBase" -m _)") == "-"* ]]; then
    if $DRY_RUN; then
      echo "$branch is merged into $MAIN_BRANCH and can be deleted"
    else
      git branch -D "$branch"
    fi
  fi
done
