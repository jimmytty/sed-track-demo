#!/bin/bash

while read dir; do
    (
        cd $dir
        bats test-$dir.bats &>/dev/null && tests='OK' || tests='FAIL'
        echo "$dir ... $tests"
    )
done < <(
    find . -mindepth 1 -maxdepth 1 -type d -not -name '.git' -printf '%f\n'
)
