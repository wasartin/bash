#!/bin/bash
COUNTER=0
CONTINUE=true

function isFileAccessible(){
    input_file=$@
    if [[ -f ${input_file}.java ]]; then
      return 0
    else
      return 1
    fi
}

function isExtensionIncluded(){
file_name=$@
  if [[ $file_name == *".java" ]]; then
    return 0
  else
    return 1
  fi
}

if [ "$#" = "0" ]; then
    read -p "Please give a file_name to replicate: " INPUT_FILE
    read -p "Please input a number for iteration cycles: " ITER_CYCLE
elif [ "$#" = "1" ]; then
    INPUT_FILE="$1"
    read -p "Please input a number for iteration cycles: " ITER_CYCLE
else
    INPUT_FILE="$1"
    ITER_CYCLE="$2"
fi

# reset/cleanup
rm -f "${INPUT_FILE}_result.txt"
rm -f "${INPUT_FILE}.class"
if [[ $(isExtensionIncluded $INPUT_FILE; echo $?) -eq 0 ]]; then
  INPUT_FILE=${INPUT_FILE/%".java"}
fi

if [[ $(isFileAccessible $INPUT_FILE; echo $?) -eq 0 ]]; then
    echo "File Found - ${INPUT_FILE}.java"
    # optionally watch the result.txt file with "tail -f result.txt"
    while $CONTINUE; do
	COUNTER=$[COUNTER+1]
	echo "Iteration:= " $COUNTER
	rm -f "${INPUT_FILE}.class" # remove executable
	javac "${INPUT_FILE}.java"  # make a new executable
	rm -f "${INPUT_FILE}.java"  # remove source file
	if [ -x ${INPUT_FILE}.class ]; then
	    echo "Don't have permission to execute class"
	    chmod +x ${INPUT_FILE}
	fi
	# execute input file, append/create results to *_result.txt,
	java ${INPUT_FILE} 2>> "${INPUT_FILE}_result.txt" 1>> "${INPUT_FILE}.java"
	if [ $((COUNTER%${ITER_CYCLE})) -eq 0 ]; then
	    read -p "Do you want to continue? [y/n] " answer
	else
	    answer="$@"
	fi
	if [ "$answer" == "n" ]; then
	   CONTINUE=false
	fi
    done
else
    echo "File Not Found -  ${INPUT_FILE}.java"
fi
