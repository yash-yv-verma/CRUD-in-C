#!/bin/bash
#This is update.bash

#read -p "Department code: " dept_code
#read -p "Department name: " dept_name
#read -p "Course number: " course_num 
#read -p "Course name: " course_name 
#read -p "Scheduled days: " course_sched 
#read -p "Course start: " course_start 
#read -p "Course end: " course_end 
#read -p "Credit hours: " course_hours 
#read -p "Enrolled students: " course_size 

read -p "Enter department code: " dept_code
read -p "Enter department name: " dept_name
read -p "Enter course number: " course_num
read -p "Enter course name: " course_name
read -p "Enter course schedule: " course_sched
read -p "Enter course start: " course_start
read -p "Enter course end: " course_end
read -p "Enter course credit hours: " course_credits
read -p "Enter initial course enrollment: " course_size


dept_code=${dept_code^^}
fp=$(pwd)

if [ -e "$fp/data/$dept_code${course_num}.crs" ]; then
	
	{
		read dept_code2 dept_name2
		read course_name2
		read course_sched2 course_start2 course_end2
		read course_credits2
		read course_size2
	}<$"$fp/data/$dept_code${course_num}.crs"
	
	[ "$dept_code" = "" ] && dept_code=$dept_code2
	[ "$dept_name" = "" ] && dept_name=$dept_name2
	[ "$course_name" = "" ] && course_name=$course_name2
	[ "$course_sched" = "" ] && course_sched=$course_sched2
	[ "$course_start" = "" ] && course_start=$course_start2
	[ "$course_end" = "" ] && course_end=$course_end2
	[ "$course_credits" = "" ] && course_credits=$course_credits2
	[ "$course_size" = "" ] && course_size=$course_size2
	echo -e "$dept_code ${dept_name}\n${course_name}\n$course_sched $course_start ${course_end}\n${course_credit}\n$course_size" >"./data/${dept_code^^}${course_num}.crs"
	echo "$(date) UPDATED: $dept_code $course_num $course_name" >> data/queries.log

else
	echo "ERROR: course not found"
fi	
