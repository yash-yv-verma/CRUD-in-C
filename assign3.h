#ifndef ASSIGN3_H
#define ASSIGN3_H

// Structure definition for a course
typedef struct {
    char course_Name[80];
    char course_Sched[4];
    unsigned course_Hours;
    unsigned course_Size;
    unsigned padding;
} COURSE;

// Function declarations
void createC(FILE* file);
void updateC(FILE* file);
void readC(FILE* file);
void deleteC(FILE* file);
void printmenu();

#endif  // ASSIGN3_H

