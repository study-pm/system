#!/bin/bash

DIR_PATH="$(dirname "$0")"

source $DIR_PATH/CONS.sh
source $DIR_PATH/utils.sh

printFormat "=== Running ===" $BLUE $BOLD
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Error: Invalid argument count" $BLUE
printFormat "- Call 1: ./task_01" $GRAY
$DIR_PATH/task_01
printFormat "- Call 2: ./task_01 1" $GRAY
$DIR_PATH/task_01 1
printFormat "- Call 3: ./task_01 1 +" $GRAY
$DIR_PATH/task_01 1 +
printFormat "- Call 4: ./task_01 1 + 2 x" $GRAY
$DIR_PATH/task_01 1 + 2 x
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Error: Invalid operand" $BLUE
printFormat "- Call 5: ./task_01 a + 2" $GRAY
$DIR_PATH/task_01 a + 2
printFormat "- Call 6: ./task_01 1 + b" $GRAY
$DIR_PATH/task_01 1 + b
printFormat "- Call 7: ./task_01 a + b" $GRAY
$DIR_PATH/task_01 a + b
printFormat "- Call 8: ./task_01 1 + 2.5" $GRAY
$DIR_PATH/task_01 1 + 2.5
printFormat "- Call 9: ./task_01 1.33 + 2" $GRAY
$DIR_PATH/task_01 1.33 + 2
printFormat "- Call 10: ./task_01 1.33 + 2.5" $GRAY
$DIR_PATH/task_01 1.33 + 2.5
printFormat "- Call 12: ./task_01 1 a 2" $GRAY
$DIR_PATH/task_01 1 a 2
printFormat "- Call 13: ./task_01 1 % 2" $GRAY
$DIR_PATH/task_01 1 % 2
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Error: Division by zero" $BLUE
printFormat "- Call 14: ./task_01 1 / 0" $GRAY
$DIR_PATH/task_01 1 / 0
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Success: Addition" $BLUE
printFormat "- Call 15: ./task_01 1 + 2" $GRAY
$DIR_PATH/task_01 1 + 2
printFormat "- Call 16: ./task_01 -1 + 2" $GRAY
$DIR_PATH/task_01 -1 + 2
printFormat "- Call 17: ./task_01 1 + -2" $GRAY
$DIR_PATH/task_01 1 + -2
printFormat "- Call 18: ./task_01 -1 + -2" $GRAY
$DIR_PATH/task_01 -1 + -2
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Success: Subtraction" $BLUE
printFormat "- Call 19: ./task_01 1 - 2" $GRAY
$DIR_PATH/task_01 1 - 2
printFormat "- Call 20: ./task_01 -1 - 2" $GRAY
$DIR_PATH/task_01 -1 - 2
printFormat "- Call 21: ./task_01 1 - -2" $GRAY
$DIR_PATH/task_01 1 - -2
printFormat "- Call 22: ./task_01 -1 - -2" $GRAY
$DIR_PATH/task_01 -1 - -2
