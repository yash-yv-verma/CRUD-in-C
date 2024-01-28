#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num

dept_code=${dept_code^^}
fp=$(pwd)
if [ -e "$fp/data/$dept_code${course_num}.crs" ]; then
	rm $fp/data/$dept_code${course_num}.crs
	echo "$(date) DELETED: $dept_code $course_num $course_name" >> data/queries.log
	echo "$course_num was successfully deleted"
else	
	echo "ERROR: course not found"
fi
