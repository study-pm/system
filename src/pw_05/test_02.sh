#!/bin/bash

DIR_PATH="$(dirname "$0")"

source $DIR_PATH/CONS.sh
source $DIR_PATH/utils.sh

printFormat "********************************" $BLUE $BOLD
printFormat "* === Testing Algorythm 02 === *" $BLUE $BOLD
printFormat "********************************" $BLUE $BOLD
printFormat -n "Case 01:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 5 > 9 > 12" $BLUE
printFormat "- Execution 1: ./task_02 1.23 2.33 4.56 5.78" $GRAY
$DIR_PATH/task_02 1.23 2.33 4.56 5.78
printFormat "- Expected: 7.2929" $GRAY
printFormat -n "Case 02:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 5 > 8 > 12" $BLUE
printFormat "- Execution 2: ./task_02 1.23 2.33 5 5.78" $GRAY
$DIR_PATH/task_02 1.23 2.33 5 5.78
printFormat "- Expected: 3.8621" $GRAY
printFormat "- Execution 3: ./task_02 1.23 2.33 5.78 9" $GRAY
$DIR_PATH/task_02 1.23 2.33 5.78 9
printFormat "- Expected: 3.86082" $GRAY
printFormat -n "Case 03:" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 7 > 11 > 13" $BLUE
printFormat "- Execution 4: ./task_02 -1.23 2.33 5.78 9" $GRAY
$DIR_PATH/task_02 -1.23 2.33 5.78 9
printFormat "- Expected: 7.77102" $GRAY
printFormat -n "Case 04 (Unsupported):" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 7 > 10" $BLUE
printFormat "- Execution 5: ./task_02 -1.23 2.33 5 9" $GRAY
$DIR_PATH/task_02 -1.23 2.33 5 9
printFormat -n "Case 05 (Unsupported):" $BLUE $BOLD $UNDERLINE
printFormat " 1 > 2 > 3 > 4 > 6" $BLUE
printFormat "- Expected: Случай не предусмотрен" $GRAY
printFormat "- Execution 6: ./task_02 0 2.33 -5.67 -8.9" $GRAY
$DIR_PATH/task_02 0 2.33 -5.67 -8.9
printFormat "- Expected: Случай не предусмотрен" $GRAY
