#!/bin/bash

#Reading apropriate information needed to create a course.
read -p "Department code: " dept_code
read -p "Department name: " dept_name
read -p "Course number: " course_num
read -p "Course name: " course_name
read -p "Scheduled days: " course_sched
read -p "Course start: " course_start
read -p "Course end: " course_end
read -p "Credit hours: " course_hours
read -p "Enrolled students: " course_size

dept_code=${dept_code^^}

fp=$(pwd)

#If file exists, then ERROR is outputted.
if [ -e "$fp/data/$dept_code${course_num}.crs" ]; then
	echo "ERROR: course already exists"
#Else, we create a (.crs) file for it AND log its creation in the log.
else
	echo -e "$dept_code $dept_name\n$course_name\n$course_sched $course_start $course_end\n$course_hours\n$course_size" > data/$dept_code$course_num.crs
	echo "$(date) CREATED: $dept_code $course_num $course_name" >> data/queries.log
fi	
