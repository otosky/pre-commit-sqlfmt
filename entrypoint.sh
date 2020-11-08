#!/bin/bash

FMT_PARAMS="--use-spaces --print-width 45"

for filename in $@;
do 
  cat $filename  | cockroach sqlfmt $FMT_PARAMS | sponge $filename

  # add a final semi-colon if missing at EOF
  sed -E '$ s/;?$/;/' $filename | sponge $filename

  # display changes for pre-commit
  git diff --color $filename | cat
done
