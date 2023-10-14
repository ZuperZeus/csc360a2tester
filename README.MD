# Assignment 2 Tester

## This is a tester program for csc360 assignment 2.

Please note that the tester failing does *not* necessarily mean that your program generated the wrong output,
if 2 threads output simultaneously, the order may not be the same every time.

To run this, first make sure the script is executable by running `chmod u+x ./tester.sh`
Then, run `./tester.sh <input file> <output file>` if you have your own files,
or  `./tester.sh <num>.trains <num>.results` if using the provided files.
If using the provided files, each file tests something different, the specifics are explained here:

### 1
test file provided in the pdf
### 2
has 4 W trains and 1 e train, to test that starvation rule
### 3
has 1 high priority and 1 low priority trains, to test the priority rules
### 4
has 3 high priority trains, E goes first, and then W should go first by 4b
### 5
has 2 high priority trains, E and W, W should go first as Westbound has priority by 4b
### 6
has 3 trains, 2 have everything identical except for load. lower load should go first
### 7
has 2 identical trains, the only difference is where they appear in the input file. train 0 goes first
### 8
integrates all of the previous examples, and should test all rules, a more detailed explanation follows below:
Test case 8 is the following, but this one has comments, 8.trains does not
	W 0 20 //first train to ensure there will always be an opposite train, no trains finish loading before second 2.0
	//High priority:
		W 0 20
		//Different from last, i.e. alternating directions
			//Load first
				E 1 2
				W 1 2
			//Load last
				E 2 2
				W 2 2
		//Same as last, i.e. same direction for all
			W 3 2
			W 4 2 //At this point, Eastbound trains are starved, so an 'e' must cross
			e 0 2 //included to test the starvation rule, 0 to avoid other low priority trains from crossing here
			W 5 2
			W 6 2
	//Low priority:
		//Different from last, i.e. alternating directions
			//Load first
				e 1 2
				w 1 2
			//Load last
				e 2 2
				w 2 2
		//Same as last, i.e. same direction for all
		//starvation, but there are no Westbound trains
		//This should not cause an error
			e 3 2
			e 4 2
			e 5 2
			e 6 2
