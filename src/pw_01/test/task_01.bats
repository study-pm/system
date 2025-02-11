#!/usr/bin/env bats

setup() {
    load '../node_modules/bats-support/load'
    load '../node_modules/bats-assert/load'
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "Can run the script" {
    echo '# task_01.sh' >&3
    run task_01
}

@test "Error: Invalid agruments count / Empty" {
    echo '# task_01.sh' >&3
    run task_01
    assert_failure
    assert_output -p "Error: Invalid agrument count"
}

@test "Error: Invalid agruments count / 1" {
    echo '# task_01.sh 1' >&3
    run task_01 1
    assert_failure
    assert_output -p "Error: Invalid agrument count"
}

@test "Error: Invalid agruments count [task_01.sh 1 +]" {
    run task_01 1 +
    assert_failure
    assert_output -p "Error: Invalid agrument count"
}

@test "Error: Invalid agruments count [task_01.sh 1 + 2 x]" {
    run task_01 1 + 2 x
    assert_failure
    assert_output -p "Error: Invalid agrument count"
}

@test "Error: Invalid operand 1 / NAN [task_01.sh a + 2]" {
    run task_01 a + 2
    assert_failure
    assert_output -p "Error: Invalid operand"
}

@test "Error: Invalid operand 2 / NAN [task_01.sh 1 + b]" {
    run task_01 1 + b
    assert_failure
    assert_output -p "Error: Invalid operand"
}

@test "Error: Invalid operands / NAN [task_01.sh a + b]" {
    run task_01 a + b
    assert_failure
    assert_output -p "Error: Invalid operand"
}

@test "Error: Invalid operand 1 / fraction [task_01.sh 1.2 + 3]" {
    run task_01 1.2 + 3
    assert_failure
    assert_output -p "Error: Invalid operand"
}

@test "Error: Invalid operand 2 / fraction [task_01.sh 1 + 2.3]" {
    run task_01 1 + 2.3
    assert_failure
    assert_output -p "Error: Invalid operand"
}

@test "Error: Invalid operands / fraction [task_01.sh 1.2 + 3.4]" {
    run task_01 1.2 + 3.4
    assert_failure
    assert_output -p "Error: Invalid operand"
}
