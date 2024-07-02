#!/bin/bash

while read dir; do
    (
        cd $dir
        bats test-$dir.bats | grep -q '^not ok' && tests='FAIL' || tests='OK'
        echo "$dir .... $tests"
    )
done < <(
    find . -mindepth 1 -maxdepth 1 -type d -not -name '.git' -printf '%f\n' |
        sort
)
