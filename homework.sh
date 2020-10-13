#!/bin/bash
if [ $# != 1 ]; then
    echo "Error: Need your GitHub User name as one argument." $*
    exit 1
else
    echo "Start creating New Repository on your GitHub..."
fi

reposname=$(pwd | awk -F"/" '{print $NF}')

curl -u $1 https://api.github.com/user/repos -d '{"name":"'$reposname'","description":"This Repos created from CLI."}'

touch README.md
echo "Now Editing..." >> README.md

rm ./homework.sh

git init
git add .
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/$1/${reposname}.git
git push -u origin master



