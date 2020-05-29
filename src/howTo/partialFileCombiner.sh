#!/bin/bash

# echo | head -5 part-r-00000 >> result.txt
# echo | tail -5 part-r-00000 >> result.txt

TARGET_FILE="result.txt"

# helper function for something
function accessFile(){
	CURR_FILE="$1"
    if [ -f "$CURR_FILE" ]; then
		echo "$CURR_FILE" >> "${TARGET_FILE}"
		echo "Top 5" >> "${TARGET_FILE}"
		echo | head -5 "${CURR_FILE}" >> "${TARGET_FILE}"
		echo "Bottom 5" >> "${TARGET_FILE}"
		echo | tail -5 "${CURR_FILE}" >> "${TARGET_FILE}"
		echo " "
    else 
		echo "%CURR_FILE not found"
	fi
}

function displayHelp(){
   echo "Usage: partialFileCombiner <file-1> ... <file-n>"
   echo "This will combine the first 5 and last 5 of each input file into one target file"
}

if [ $# -eq 0 ]; then
    echo "Needs more args"
    return -1
else
	if [[ $# -eq 1  ]] && [[ "$1" = "-h" ]]; then
		displayHelp
	else 
		for input in "$@"; do
			accessFile $input
		done
	fi
fi
