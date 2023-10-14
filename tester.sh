#Author: ZuperZeus
#!/bin/bash
if [[ $# -eq 0 ]]
then
	echo "This program will test whether your program is correct or not"
	echo "You must be inside the directory containing make"
	echo "The input file will be used to run ./mts <input file>"
	echo "The output file should contain the expected output"
	echo "For help, run with argument -h"
	exit
fi
if [[ $# -ne 2 ]]
then
	echo "You must provide 2 arguments"
	echo "The 1st argument being: <input file>"
	echo "The 2nd argument being: <output file>"
	exit
fi
if ! [[ -f $1 ]] || ! [[ -f $2 ]]
then
	echo "Both arguments must be a file in the current directory"
	echo " input file: $1"
	echo "output file: $2"
	exit
fi
make > /dev/null
if ! [[ $? -eq 0 ]]
then
	echo "make failed, exiting..."
	exit
fi
#run the program with the output file, 
#and check for any differences against the output file
./mts $1 | diff --side-by-side <(nl -) <(nl $2)
if [[ $? -eq 0 ]]
then
	echo "The program has passed this test :)"
else
	echo "The program might have failed this test"
	echo "Please check that the errors marked are correct"
	echo "Some false errors may be because of threads outputting simultaneously "
fi
