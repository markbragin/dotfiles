#!/bin/bash

# script that sync my notes with GitHub

# path to vault
notes_storage=~/notes
#get to the vault
cd $notes_storage

# pull changes down from remote repo
git pull

# check if there any changes
check_changes=$(git status --porcelain | wc -l)
if [ $check_changes -eq 0 ]
then
    exit 0
fi

# add changes to stage, commit and push
# message contains time and date of the commit
git add -A
git commit -m "Last sync: $(date +"%d-%m-%Y %H:%M:%S")"
git push
