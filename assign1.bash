#!/bin/bash

	#Intial menu print
	echo "Enter one of the following actions or press CTRL-D to exit."
	echo "C - create a new course record"
	echo "R - read an existing course record"
	echo "U - update an existing course record"
	echo "D - delete an existing course record"
	echo "E - update enrolled student count of existing course"
	echo "T - show total course count"

#Loops till CTRL-D
while read selection; do

	#Based of selection implements appropriate script
	case "$selection" in
		[Cc]) 
			source create.bash;;
		[Rr]) 
			source read.bash;;
		[Uu]) 
			source update.bash;;
		[Dd]) 
			source delete.bash;;
		[Ee]) 
			source enroll.bash;;
		[Tt]) 
			source total.bash;;
		*) 
			echo "ERROR: invalid option";;
	esac #End case

	#Prints menu after each selection and implementation is complete
	echo "Enter one of the following actions or press CTRL-D to exit."
	echo "C - create a new course record"
	echo "R - read an existing course record"
	echo "U - update an existing course record"
	echo "D - delete an existing course record"
	echo "E - update enrolled student count of existing course"
	echo "T - show total course count"

done #End while
