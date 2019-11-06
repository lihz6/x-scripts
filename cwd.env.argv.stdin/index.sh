#!/usr/bin/env bash

echo $(pwd)
echo $PATH

# $0: path to this script
for arg in $@; do # $1 $2 $3...
  echo $arg
done

while read line; do
  echo "$line"
done </dev/stdin
