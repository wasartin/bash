#!/bin/bash


# function to remove spaces
function removeSpace(){
    space=" "
    under="_"
    input="$1"
    inputLength="${#input}"
    inputLength=$[inputLength+1]
    fullInput="$@"
    inputTrim=${fullInput:$inputLength}
    target=${inputTrim//$space/$under}

    underscores="${target//[^$under]}"
    underscoresNum="${#underscores}"
    if [[ "$underscoresNum" -eq 0 ]] && [[ "${#input}" -eq "${#inputTrim}" ]]; then
      echo "$input contained no spaces."
      return 0;
    elif [[ -f "$target" ]] || [[ -d "$target" ]]; then
      echo "Couldn't rename, $target already exists."
      return 1;
    else
	     echo "$input -> $target"
	     mv "$input" "$target"
	     return 0;
    fi
}

#function stripAdditionalSpaces(){
    
#}

if [ $# -eq 0 ]; then
    echo "You Suck";
    return -1;
else
    for input; do
	if [[ -f "$input" ]] || [[ -d "$input" ]]; then
	    echo "Length of input: ${#input}"
	    someVar=$(echo $input)
	    otherLen=${#someVar};
	    echo "Stripped Length: $otherLen"
	    removeSpace "$input" $input;
	else
	    echo "Source $input does not exist, skipping";
	    #return 127;
	fi;
    done
fi
