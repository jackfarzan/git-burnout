#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Usage: git-burnout [dir]"
    exit 1
fi

echo "Executing in $PWD..."

for d in */ ; do
	if [[ $( git -C "$d" rev-parse --git-dir 2> /dev/null) == ".git" ]]
	  then
		echo "$d is a git repo, good riddance"
		rm -rf $(realpath $d)
	fi
done

echo "Repos removed! Happy healing"