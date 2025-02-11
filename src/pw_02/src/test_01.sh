#!/bin/bash

DIR_PATH="$(dirname "$0")"

source $DIR_PATH/CONS.sh
source $DIR_PATH/utils.sh

printFormat "*********************************************" $BLUE $BOLD
printFormat "* === Run 01: Rombus in pseudo graphics === *" $BLUE $BOLD
printFormat "*********************************************" $BLUE $BOLD
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Error: Invalid argument count" $BLUE
printFormat "- Call 1: ./task_01" $GRAY
$DIR_PATH/task_01
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Error: Invalid argument" $BLUE
printFormat "- Call 2: ./task_01 a" $GRAY
$DIR_PATH/task_01 a
printFormat "- Call 3: ./task_01 -1" $GRAY
$DIR_PATH/task_01 -1
printFormat "- Call 4: ./task_01 0" $GRAY
$DIR_PATH/task_01 0
printFormat "- Call 5: ./task_01 2" $GRAY
$DIR_PATH/task_01 2
printFormat -n "Case" $BLUE $BOLD $UNDERLINE
printFormat " Success" $BLUE
printFormat "- Call 6: ./task_01 1" $GRAY
$DIR_PATH/task_01 1
printFormat "- Call 7: ./task_01 3" $GRAY
$DIR_PATH/task_01 3
printFormat "- Call 8: ./task_01 5" $GRAY
$DIR_PATH/task_01 5
printFormat "- Call 9: ./task_01 7" $GRAY
$DIR_PATH/task_01 7
printFormat "- Call 10 ./task_01 9" $GRAY
$DIR_PATH/task_01 9
