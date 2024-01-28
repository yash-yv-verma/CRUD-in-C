#!/bin/bash
#This is read.bash


read -p "Enter a department code and course number: " dept_code course_num

dept_code=${dept_code^^}
fp=$(pwd)

if [ -e "$fp/data/$dept_code${course_num}.crs" ]; then

{
	read dept_code dept_name
	read course_name
	read course_sched course_start course_end
	read course_credits
	read enroll_students
} <$"$fp/data/$dept_code${course_num}.crs"

	echo "Course department: $dept_code $dept_name"
	echo "Course number: $course_num"
	echo "Course name: $course_name"
	echo "Scheduled days: $course_sched"
	echo "Course start: $course_start"
	echo "Course end: $course_end"
	echo "Credit hours: $course_credits"
	echo "Enrolled Students: $enroll_students"

else
	echo "ERROR: course not found"
fi

