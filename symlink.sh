#!/bin/sh

DOTDIR=$(cd $(dirname "$0") && pwd)/home/

for t in `ls -a $DOTDIR`
do
	if [ "$t" != "." -a "$t" != ".." ]; then 
		ln -svi $DOTDIR$t ~/$t
	fi
done
