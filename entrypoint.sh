#!/bin/bash

FMT_PARAMS=()
# parse args passed by pre-commit to separate filenames from sqlfmt args
while [ "$#" -gt 0 ]; do
    case "$1" in
    --print-width)
        FMT_PARAMS+=("--print-width" "$2")
        shift 2
        ;;
    --tab-width)
        FMT_PARAMS+=("--tab-width" "$2")
        shift 2
        ;;
    --use-spaces)
        FMT_PARAMS+=("--use-spaces")
        shift 1
        ;;
    --align)
        FMT_PARAMS+=("--align")
        shift 1
        ;;
    --no-simplify)
        FMT_PARAMS+=("--no-simplify")
        shift 1
        ;;

    *)
        FILES="$FILES $1"
        shift 1
        ;;
    esac
done

# pass filenames to sqlfmt
for filename in $FILES; do
    formatted=$(cockroach sqlfmt "${FMT_PARAMS[@]}" <"$filename")

    if [[ "$formatted" != "" ]]; then
        # overwrite file with reformatted sql
        printf "%s\n" "$formatted" >"$filename"
        # add a final semi-colon if missing at EOF
        sed -E '$ s/;?$/;/' "$filename" | sponge "$filename"
        # display changes for pre-commit
        git diff --color "$filename" | cat
    else
        FAIL=true
    fi
done

# pre-commit needs non-zero exit code to fail hook
if [[ "$FAIL" ]]; then exit 1; fi
