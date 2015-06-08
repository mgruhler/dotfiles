#!/bin/bash

CLEANUPFILE=rfid_manager_clean.log

cleanup() {
  lastline=""
  while read -r line
  do
     if [[ ! $lastline =~ "enough iterations for reset at front-tag" || ! $line =~ "enough iterations for reset at front-tag" ]]; then
        echo "$line"
     fi
     lastline=$line
  done < $1 > $CLEANUPFILE
}

for f in $(find . -name 'rfid_manager.log'); do
  echo "cleaning up \"$f\""
  cleanup $f
  echo "Cleanup for \"$f\" done"
  mv $CLEANUPFILE $f
  echo "---"
done
