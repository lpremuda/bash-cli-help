#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source ${SCRIPT_DIR}/shared/load_shared_resources.sh

printTitle "Get current branch name:"
echo "git rev-parse --abbrev-ref HEAD"

printTitle "git config"
echo -e "git config --list --show-origin"
echo -e "git config --global --list"
echo -e "git config --local --list"

printTitle "Tag"
echo "git fetch --all --tags"
echo "git checkout tags/<tag>"
echo -e "e.g. git checkout tags/v1.62.0"
echo "git tag"

printTitle "Aliases"
echo "gst='git status'"
echo "gd='git diff'"
echo "ga='git add'"
echo "grs='git restore'"
echo "grst='git restore --staged'"
echo "gcmsg='git commit -m'"
echo "ggpush='git push origin \"\$(git_current_branch)\"'"
echo "gcm='git checkout \"\$(git_main_branch)\"'"

printTitle "Rebase and Force Push"
echo "git pull —r origin <branch_name>"
echo "git push —force origin <branch_name>"

printTitle "Add files to latest commit without editing commit message:"
echo "git add [FILES_TO_ADD]"
echo "git commit --amend --no-edit"
echo "git push --force (ggpush --force)" 

printTitle "Undo latest commit and leaving working tree untouched:"
echo "git reset HEAD~"

printTitle "Fix commit message of last commit:"
echo "git commit --amend -m \"New commit message\""

printTitle "Create a commit that reverts the changes of the latest commit:"
echo "git revert HEAD"

printTitle "Modify a specific commit:"
echo "https://stackoverflow.com/questions/1186535/how-do-i-modify-a-specific-commit"

printTitle "Skip pre-commit hooks:"
echo "git commit --no-verify --mesage [MESSAGE]"

printTitle "Log"
echo "git log --oneline"
echo "git log --stat"
echo "git log --patch (-p)"
echo "git log <commit SHA>"
echo "git log --graph"
echo "git log --graph --oneline"

echo ""
