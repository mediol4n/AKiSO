#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "USAGE: sh zad4.sh [URL] [time interval in seconds]"
  exit 1
fi
if ! [[ $2 =~ ^[0-9]+$ ]]; then
  echo incorrect second argument >&2
  exit 1
fi

url=$1
interval=$2
rm -rf .git 2>/dev/null
git init >/dev/null
lynx -dump $url > site
git add site
git commit -m "Site created" >/dev/null

while true ; do
        lynx -dump $url > tmp
        diffrence=$(diff site tmp)
        if [ ! -z  "$diffrence" ] ; then
                echo "Changes occured"
                echo "${diffrence}"
                mv tmp site
                git add site
                git commit -m "site changed" > /dev/null
        fi
        sleep $interval
done

