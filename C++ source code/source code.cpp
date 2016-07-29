/* 
 * File:   main.cpp
 * Author: Yifan Jiang  924001904
 */

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <time.h>
#include "string.h"
using namespace std;

#define RANGE ((int)'Z'-(int)'A'+1)     // the number of letters from Z to A in ASCII
#define GAP ((int)'a'-(int)'Z'-1)       // the distance between Z and a in ASCII

#define COURSE_FILE "./CourseDataRan.txt"   // name of file containing data in relation 'Courses'
#define COURSE_NUM  2000          // number of tuples in relation "Courses"

#define FACULTY_FILE "./FacultyDataRan.txt"  // name of file containing data in relation 'Faculty'
#define FACULTY_NUM 1500        // number of tuples in relation "Faculty"

#define TEACH_FILE "./TeachDataRan.txt"      // name of file containing data in relation 'Teach'
#define TEACH_NUM   550        // number of tuples in relation "Teach"

//to generate a sequential sting of length "len", only for big letters
static int count1;
void seq_str(int start) { count1 = start; }		// set the starting letter, e.g for a 4 letter string, 0 is AAAA, 1 is BAAA
char* seq_str(char* p, int len)                        // generate the sequential string
{
    int n = count1;
    for(int i=0; i<len; i++)
    {   
        p[i] = (char)((n%RANGE)+(int)'A');
        n /= RANGE;
    }
    p[len]='\0';
    count1++;
    return p;
}

// generate a random sting of length "len", including both big and small letter
char* ran_str(char* p, int len)   
{
    int num, dis;
    for(int i=0;i<len;i++)
    {
        num = rand()%(RANGE*2);
        dis = (num>RANGE-1)?(num+GAP):num;   // there is a gap between Z and a
        p[i] = (char)(dis + (int)'A');
    }
    p[len]='\0';
    return p;
}

// generate a sequential number
static int count2;
void seq_num(int set) { count2 = set;}  // set the initial number
int seq_num() {return(++count2);}       // return the next number


// generate a random number between min and max
int ran_num(int min, int max)
{ return (rand()%(max-min+1)+min); }

// skip n time character of m in file
void skip_char(fstream& file, int n, char m)
{
    char temp[100];
    for(int i=0; i<n; i++)
        file.getline(temp,100,m);
}

//main function
int main() {
    
    srand(time(NULL)); 	// initialization for random function
    
    // create the data for relation 'Courses'
    fstream file1(COURSE_FILE,ios::out);
    if(file1)
    {
        seq_str(0);          // set the starting sequential string
        seq_num(2001);      // set the starting sequential number
        char p[3][10];      // char pointers for storing string
        int credit, hour;   // for storing the attributes, credit and hour in relation 'Courses'
 
        for(int i=0; i<COURSE_NUM; i++)
        {
            credit = ran_num(3,4);		// attribute 'credit' can be either 3 or 4
            hour = (credit==3)?150:200;		// attribute 'hour' is dependent on credit
            //Format: Name, Number, Location, Credits, Hours
            file1<<ran_str(p[0],5)<<'\t'<<seq_num()<<'\t'<<seq_str(p[1],4)<<ran_str(p[2],2)
                 <<ran_num(100,999)<<'\t'<<credit<<'\t'<<hour<<'\n';
        }
    }
    else
        cout<< "File for 'Courses' cannot be created !\n";
    file1.close();
    
    // create the data for relation 'Faculty'
    fstream file2(FACULTY_FILE,ios::out);
    if(file2)
    {
        seq_str(4000);                 // set the starting sequential string
        seq_num(6405);                 // set the starting sequential number
        char p[4][10];                 // char pointers for storing string
        
        // for storing the attributes, credit and hour in relation 'Courses'
        char title[4][20] = {"Lecturer","Assistant Prof.","Associate Prof.","Prof."};   
        
        for(int i=0; i< FACULTY_NUM; i++)
        {
            //Format: StaffID, Name, Title, Office, Email
            file2<<seq_num()<<ran_num(100,999)<<'\t'<<ran_str(p[0],4)<<' '<<ran_str(p[1],3)<<'\t'
                 <<title[ran_num(0,3)]<<'\t'<<ran_str(p[2],4)<<ran_num(234,865)<<'\t'<<seq_str(p[3],4)<<"@tamu.edu"<<'\n';
        }
    }
    else
        cout<< "File for 'Faculty' cannot be created !\n";
    file2.close();
    
    // create data for relation 'Teach' by extracting from 'Courses' and 'Faculty'
    fstream file3(TEACH_FILE,ios::out);
    
    file1.open(COURSE_FILE,ios::in);
    file2.open(FACULTY_FILE,ios::in);
    
    if(file1&&file2&&file3)
    {
        char p[4][20];    // char pointers for storing string
        int step1 = COURSE_NUM/TEACH_NUM, step2 = FACULTY_NUM/TEACH_NUM;	// the max step to fetch each date from Courses and Faculty
        for(int i=0; i< TEACH_NUM; i++)
        {
            skip_char(file1,ran_num(1,step1), '\n');    // skip random line (not more than step) in relation 'Courses'
            skip_char(file2,ran_num(1,step2), '\n');    // skip random line (not more than step) in relation 'Faculty'
           
            file2.getline(p[0],20,'\t');		// extract StaffID 
            skip_char(file2,3,'\t');
            file2.getline(p[1],20,'\n');              // extract Name
            
            skip_char(file1,1,'\t');
            file1.getline(p[2],20,'\t');		// extract Office
            file1.getline(p[3],20,'\t');		//extract Email
            skip_char(file1,1,'\n');
            
            //Format: StaffID, Name, Title, Office, Email
            file3<<p[0]<<'\t'<<p[1]<<'\t'<<p[2]<<'\t'<<p[3]<<'\n';
        }
    }
    else
        cout<< "File for 'Teach' cannot be created !\n";
    file1.close();
    file2.close();
    file3.close();
      
    return 0;
}
