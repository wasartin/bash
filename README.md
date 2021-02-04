# Simple Functionality Cheat Sheet
- [Understanding Args](#understanding-args)
- [If-Else](#if-else-prompt)
- [Input Reader While Loop](#input-reader-while-loop)
- [Switches with Opts](#switches-with-opts)
- [Counting Up](#counting-up)
- [Consume Args](#consume-args)
- [Args with For Loop](#args-with-for-loop)
- [Case](#case)
- [Power Script](#power-script)
- [Int Compare](#int-compare)
- [Fahrenheit to Celsius (Function)](#fahrenheit-to-celsius)

### Understanding Args
```bash
echo "zeroth: $0"; echo "first : $1"
echo "second: $2"; echo "third : $3"
echo "number: $#"; echo "all   : $@"
```
### If-Else Prompt
```bash
#!/bin/bash
if [ "$#" = "0" ]; then
   read -p "What is your name? " name
else
   name="$@"
fi
printf 'Hello, %s!\n' "$name"
```
### Input Reader While Loop
```bash
#!/bin/bash
echo Enter names, one per line
while read first rest; do
      echo Hello, $first
done
```
### Switches with Opts
```bash
#!/bin/bash
while getopts "habs:" SW; do
   if [ "$SW" = "h" ]; then
      echo "Legal switches: -h -a -b -s size"
      exit 1
   elif [ "$SW" = "a" ]; then
      echo "Switch a was set"
   elif [ "$SW" = "b" ]; then
      echo "Switch b was set"
   elif [ "$SW" = "s" ]; then
      echo "Switch s with argument $OPTARG"
   else
      echo "Unknown switch: $SW"
   fi
done
```
### Counting up
```bash
#!/bin/bash
if [ $# -ne 2 ]; then
    echo Usage: $0 start stop
    exit 1
fi
N=$1
while [ $N -le $2 ]; do
    echo $N
    N=$[N+1]
done
```
### Consume Args
```bash
#!/bin/bash
while [ $# -gt 0 ]; do
      echo Hello, $1
      shift #consume arguments. you are shfting right
done
```
### Args with For Loop
```bash
#!/bin/bash
for name; do #could do 'for name in $@
    echo Hello, $name
done
```
### Case
```bash
#!/bin/bash
read -p "What is your name? " name
case "$name" in
   Voltron)
	echo "sup $name, defender of stuff"
   ;;
   Monty}
	read -p "What is your favorite color? " color       
	echo "$name answered incorrectly with $color"
	 ;;
   She-[ Rr ]a)
	echo "Oh, you have been rebooted?"
   ;;
   *)
      echo "Hello $name!"
   ;;
esac
```
### Power script
```bash
#/bin/bash
N=0
P=1
while [ $P -ge 1 ]; do
      echo "2^$N = $P"
      N=$[N+1]
      P=$[2*P]
done
```
### Int Compare
```bash
#!/bin/bash
read -p "Enter an integer: " i
if [ "$i" -lt '5' ]; then
   echo "$i is less than 5"
else
   echo "$i is greater than or equal 5"
fi
```
# Functions

### Fahrenheit to Celsius
```bash
#!/bin/bash
function fahToC(){
   arg1=$1
   arg1=$[ (arg1 - 32) * 5 / 9]
   echo "$arg1"
}

if [ $# -eq 0 ]; then
   echo "Nope"
else
   for input; do
      fahToC $input
   done
fi
```
