#!/bin/bash

# parse args passed by pre-commit to separate filenames from sqlfmt args
while [ "$#" -gt 0 ]; do
  case "$1" in
    --print-width)  width="--print-width $2"; shift 2;;
    --tab-width)    indent="--tab-width $2"; shift 2;;
    --use-spaces)   spaces="--use-spaces"; shift 1;;
    --align)        align="--align"; shift 1;;
    --no-simplify)  no_groups="--no-simplify"; shift 1;;
    
    *) FILES="$FILES $1"; shift 1;;
  esac
done

# concat sqlfmt flags
FMT_PARAMS="$width $indent $spaces $align $no_groups"

# pass filenames to sqlfmt
for filename in $FILES;
do 
  cat $filename  | cockroach sqlfmt $FMT_PARAMS | sponge $filename

  # add a final semi-colon if missing at EOF
  sed -E '$ s/;?$/;/' $filename | sponge $filename

  # display changes for pre-commit
  git diff --color $filename | cat
done
