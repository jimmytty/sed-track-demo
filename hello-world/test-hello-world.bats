#!/usr/bin/env bats
load bats-extra

@test 'Say Hi! (Demo-01)' {
    run sed -E -f hello-world-demo-01.sed <<< 'Goodbye, Mars!'

    assert_success
    expected='Hello, World!'
    assert_equal "$output" "$expected"
}

@test 'Say Hi! (Demo-02)' {

    run sed -E -f hello-world-demo-02.sed <<< 'Goodbye, Mars!'

    assert_success
    expected='Hello, World!'
    assert_equal "$output" "$expected"
}
