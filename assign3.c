//Appropriate libraries
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

//Header file call
#include "assign3.h"


int main(){
    
    FILE* file = fopen("courses.dat", "rb+");
    
    if (file == NULL) {
        file = fopen("courses.dat", "wb+");
    }
    
    if (file == NULL) {
        perror("Error opening file");
    }
    
    char choice = '\0';
    
    while(true){
        
        //Prints the menu.
        printmenu();		
        
        choice = '\0';	
        if(scanf("%c", &choice) == EOF) {
            break;
        }
        if(choice == '\n'){
            if(scanf("%c", &choice) == EOF){
                return 0;
            }
        }else if(choice == '\0'){
            printf("Your choice is null");
        }
        switch(toupper(choice)) {
            case 'C':
                createC(file);
                break;
            case 'R':
                readC(file);
                break;
            case 'U':
                updateC(file);
                break;
            case 'D':
                deleteC(file);
                break;
            default:
                printf("ERROR: invalid option\n");
                break;
        }//End Switch
    }//End while
    
    fclose(file);
    
    return 0;
    
}//End main()

void printmenu() {
    
    printf("\n%s%s%s%s%s",
           "Enter one of the following actions or press CTRL-D to exit.\n",
           "C - create a new course record\n", 
           "U - update an existing course record\n", 
           "R - read an existing course record\n", 
           "D - delete an existing course record\n");
    
}

void createC(FILE* file) {
    
    COURSE newCourse;
    
    int courseNum;
    
    printf("Course Number: ");
    if (scanf("%d", &(courseNum)) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    fseek(file, courseNum * sizeof(COURSE), SEEK_SET);
    
    if (fread(&newCourse, sizeof(COURSE), 1, file) == 1) {

        if (newCourse.course_Hours != 0) {
            printf("ERROR: Course already exists\n");
            return;
        }
    }
    
    while (getchar() != '\n');
    
    printf("Course Name: ");
    fgets(newCourse.course_Name, sizeof(newCourse.course_Name), stdin);
    newCourse.course_Name[strcspn(newCourse.course_Name, "\n")] = '\0';
    
    printf("Course Schedule: ");
    if (scanf("%3s", newCourse.course_Sched) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    printf("Credit Hours: ");
    if (scanf("%u", &(newCourse.course_Hours)) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    printf("Course Enrollment: ");
    if (scanf("%u", &(newCourse.course_Size)) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    fseek(file, courseNum * sizeof(COURSE), SEEK_SET);
    fwrite(&newCourse, sizeof(COURSE), 1, file);
    
}

void readC(FILE* file) {
    
    int courseNumber;
    
    printf("Enter a CS course number: ");
    if (scanf("%d", &courseNumber) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    if(fseek(file, courseNumber * sizeof(COURSE), SEEK_SET) != 0){
        perror("Error w fseek() in readC function.");
    }
    
    COURSE course;
    
    if (fread(&course, sizeof(COURSE), 1, file) != 1) {
        printf("ERROR: Course not found\n");
        return;
    }

    if (course.course_Name[0] == '\0' && course.course_Sched[0] == '\0' && course.course_Hours == 0 && course.course_Size == 0) {
        printf("ERROR: Course not found\n");
    } else {

        printf("Course Name: %s\n", course.course_Name);
        printf("Course Schedule: %s\n", course.course_Sched);
        printf("Credit hours: %u\n", course.course_Hours);
        printf("Enrolled Students: %u\n", course.course_Size);
    }
    
}

void updateC(FILE* file) {
    
    int  courseNumber;
    
    printf("Enter a course number: ");
    if (scanf("%d", &courseNumber) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
    
    COURSE existingCourse;
    
    if (fread(&existingCourse, sizeof(COURSE), 1, file) != 1) {
        printf("ERROR: Course not found\n");
        return;
    }

    while (getchar() != '\n');
    
    printf("Course Name: ");
    char temp[80];
    fgets(temp, sizeof(temp), stdin);
    if (temp[0] != '\n') {
        temp[strcspn(temp, "\n")] = '\0';
        strcpy(existingCourse.course_Name, temp);
    }
    

    printf("Course Schedule: ");
    char tempSched[4];
    fgets(tempSched, sizeof(tempSched), stdin);
    if (tempSched[0] != '\n') {
        tempSched[strcspn(tempSched, "\n")] = '\0';
        strcpy(existingCourse.course_Sched, tempSched);
    }

    printf("Credit Hours: ");
    char tempHours[10];
    fgets(tempHours, sizeof(tempHours), stdin);
    if (tempHours[0] != '\n') {
        existingCourse.course_Hours = atoi(tempHours);
    }

    printf("Course Enrollment: ");
    char tempSize[10];
    fgets(tempSize, sizeof(tempSize), stdin);
    if (tempSize[0] != '\n') {
        existingCourse.course_Size = atoi(tempSize);
    }
    
    fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
    fwrite(&existingCourse, sizeof(COURSE), 1, file);
    
    
}

void deleteC(FILE* file) {
    
    unsigned courseNumber;
    
    printf("Enter a course number to delete: ");
    if (scanf("%u", &courseNumber) != 1) {
        printf("ERROR: Invalid input\n");
        return;
    }
    
    fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
    
    COURSE existingCourse;
    
    if (fread(&existingCourse, sizeof(COURSE), 1, file) != 1) {
        printf("ERROR: Course not found\n");
        return;
    }
    
    if (existingCourse.course_Name[0] == '\0' && existingCourse.course_Size == 0 && existingCourse.course_Hours == 0 && existingCourse.course_Sched[0] == '\0') {
        printf("ERROR: Course already deleted\n");
        return;
    }
    
    existingCourse.course_Name[0] = '\0';
    existingCourse.course_Sched[0] = '\0';
    existingCourse.course_Hours = 0;
    existingCourse.course_Size = 0;
    
    fseek(file, courseNumber * sizeof(COURSE), SEEK_SET);
    fwrite(&existingCourse, sizeof(COURSE), 1, file);
    printf("course number was successfully deleted.");
    
}
