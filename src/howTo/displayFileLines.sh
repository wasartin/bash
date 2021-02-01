#!/bin/bash

function fileCheck(){
    inputFile=$@
    [[ -f "$inputFile" ]] && [[ -f "$inputFile" ]]
}

function displayLinesOfFile(){
    INDEX=1
    while read line; do
	  echo "$INDEX $line"
	  INDEX=$[INDEX+1]
    done
}

if [ $# -eq 0 ]; then
    echo "Needs more args"
    return -1
else
    for input; do
	if [[ $(fileCheck $input; echo $?) -eq 0 ]]; then
	    INDEX=1
	    while read line; do
		echo "$INDEX $line"
		INDEX=$[INDEX+1]
	    done < $input
	else
	    echo "better luck next time"
	fi;
    done
fi
