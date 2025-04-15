#!/bin/bash

DIR_PATH="$(dirname "$0")"

source $DIR_PATH/CONS.sh
source $DIR_PATH/utils.sh

printFormat "********************************" $BLUE $BOLD
printFormat "* === Testing Algorythm 01 === *" $BLUE $BOLD
printFormat "********************************" $BLUE $BOLD
printFormat -n "Case 01:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 5 > 8" $BLUE
printFormat "- Execution 1: ./task_01 1.23 2.33 4.56 5.78" $GRAY
$DIR_PATH/task_01 1.23 2.33 4.56 5.78
printFormat "- Expected: 7.2929" $GRAY
printFormat -n "Case 02:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 7 > 11" $BLUE
printFormat "- Execution 2: ./task_01 1.23 2.33 5 5.78" $GRAY
$DIR_PATH/task_01 1.23 2.33 5 5.78
printFormat "- Expected: 3.8621" $GRAY
printFormat "- Execution 3: ./task_01 1.23 2.33 5.78 9" $GRAY
$DIR_PATH/task_01 1.23 2.33 5.78 9
printFormat "- Expected: 4.86082" $GRAY
printFormat -n "Case 03:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 6 > 10 > 12" $BLUE
printFormat "- Execution 5: ./task_01 -1.23 2.33 5.78 9" $GRAY
$DIR_PATH/task_01 -1.23 2.33 5.78 9
printFormat "- Expected: 7.77102" $GRAY
printFormat -n "Case 04 (Unsupported):" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 6 > 9" $BLUE
printFormat "- Execution 5: ./task_01 -1.23 2.33 5 9" $GRAY
$DIR_PATH/task_01 -1.23 2.33 5 9
printFormat "- Expected: Случай не предусмотрен" $GRAY
printFormat "- Execution 6: ./task_01 0 2.33 -5.67 -8.9" $GRAY
$DIR_PATH/task_01 0 2.33 -5.67 -8.9
printFormat "- Expected: Случай не предусмотрен" $GRAY
