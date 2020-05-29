#!/bin/bash

GLOBAL_INDEX=0

function fileAccessible(){
    inputFile=$@
    [[ -f "$inputFile" ]] && [[ -r "$inputFile" ]]
}

param="i"
targetFile="/proc/$param/comm"

# helper function for something
function accessFile(){
    N=$1
    fileName="${targetFile//$param/$N}" #replace the param with this Number
    if [[ $(fileAccessible $fileName; echo $?) -eq 0 ]]; then
#	echo "$fileName Exists."
	GLOBAL_INDEX=$N;
	while read line; do
	    echo "$GLOBAL_INDEX $line"
	done < $fileName
    fi
}

if [ $# -ne 2 ]; then
   echo "You Suck"
   echo "My Processes"
   echo "Usage: mypos <start-index> <stop-index>"
   echo "Displays processes with process ID within an inclusive "
   echo "range of two integers that are passed in as arguments. "
   echo "Start-index is expected to be less than or equal to stop-index."
   return -1
else
    MIN=$1
    GLOBAL_INDEX=$MIN
    MAX=$2
 #   echo "Min: $MIN, Max: $MAX"
    CURR=$MIN
    while [ $CURR -le $MAX ]; do
#	echo "Current Num: $CURR"
	accessFile $CURR
	CURR=$[CURR+1]
    done
    
fi
