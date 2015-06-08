#!/bin/bash

substring="_"

for f in $(find . -name '*.bag'); do
  bagfile=$(echo $f | sed 's/^.*FTF/FTF/')
  if [ $(grep -o "$substring" <<< "$bagfile" | wc -l) -eq 5 ]; then
    fnew="${f/\.bag/_00.bag}"
    echo "Padding bagfile \"$f\" with zeros to \"$fnew\""
    mv $f $fnew
  fi
  echo "---"
done
