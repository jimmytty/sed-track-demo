#!/bin/bash

while read dir; do
    (
        cd $dir
        if [[ ! -f test-$dir.bats ]]; then
           echo "test-$dir.bats does not exists"
           exit 1
        fi
        bats test-$dir.bats | grep -m1 -q '^not ok' && tests='FAIL' || tests='OK'
        echo "$dir .... $tests"
    )
done < <(
    find . -mindepth 1 -maxdepth 1 -type d -not -name '.git' -printf '%f\n' |
        sort
)
