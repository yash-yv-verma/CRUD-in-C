#read -p "Enter a course department code and number: " dept_code course_num
#read -p "Enter an enrollment change amount: " change_amt

#dept_code=${dept_code^^}
#fp=$(pwd)

#if [ ! -f "$fp/data/$dept_code${course_num}.crs" ]; then

#	echo "ERROR: course not found"
#	exit 1
#else
#	{
#		read dept_code dept_name
#		read course_name
#		read course_sched course_start course_end
#		read course_credits
#		read course_students
	
#	}<$"$fp/data/${dept_code}${course_num}.crs"
	
#	echo -e "$dept_code $dept_name\n$course_name\n$course_sched $course_start $course_end\n$course_hours\n$(($course_size + $change_amt))" > $fp/data/${dept_code}${course_num}.crs
	
#	echo "$(date) ENROLLED: $dept_code $course_num $course_name changed by $change_amt" >> $fp/data/queries.log

#fi


#!/bin/bash

read -p "Enter a department code and course number: " dept_code course_num
read -p "Enter an enrollment change amount: " change_amt

fp=$(pwd)


if [ ! -f "./data/${dept_code^^}${course_num}.crs" ]; then
    echo "ERROR: course not found";
    exit 1
else
    {
    read dept_code dept_name
    read course_name
    read course_sched course_start couse_end
    read course_credits
    read course_size
    } <"./data/${dept_code^^}${course_num}.crs"
    echo -e "$dept_code ${dept_name}\n${cours_name}\n$course_sched $course_start ${course_end}\n${course_credits}\n$(($course_size + $change_amt))" >"./data/${dept_code^^}${course_num}.crs"
    echo "$(date) ENROLLMENT: ${dept_code^^} $course_num $course_name changed by $change_amt" >> ./data/queries.log
fi
