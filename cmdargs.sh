#!/bin/bash

echo "The variable 0 has '$(basename $0)' in it."

echo "The variable 1 has '$1' in it"
echo "The variable 2 has '$2' in it"
echo "The variable 3 has '$3' in it"
echo "The variable 4 has '$4' in it"
echo "The variable 5 has '$5' in it"

echo "There are $# arguments/parameters on the command line"

##########
# defaults
##########
declare -a files
sides=6

##########
# functions
##########
function displayhelp {
	echo "Usage: $(basename $0) [-h | --help] [-v | --verbose] [-s N]"
	echo "    help gives help"
	echo "    verbose gives more info while running"
	echo "    sides specifies the number of sides for the die, 6 is the default"
}

##########
# command line processing
##########
while [ $# -gt 0 ]; do
	echo '$1 has '"'$1' in it"
	case "$1" in
		-h | --help )
			displayhelp
			exit
			;;
		-v|--verbose )
			verbose="yes"
			;;
		-s| --sides )
			shift
			sides="$1"
			if [ "$sides" = "" ]; then
				echo "Must give me a count of sides for the -s option"
				displayhelp
				exit 1
			elif [ "$sides" -lt 2 -o "$sides" -gt 20 ]; then
				echo "invalid count for sides option -between 2 and 20 please"
				displayhelp
				exit 1
			else
				echo rolling dice with $sides sides
			fi
			;;
		* )
			files+=("$1")
			;;
	esac
	shift
done

############
# do the work of the script
############

if [ "$verbose" = "yes" ]; then
	echo "working on files:"
	for filename in ${files[@]}; do
		echo "$filename"
	done
fi

echo "Rolled $(( RANDOM % $sides + 1))"
