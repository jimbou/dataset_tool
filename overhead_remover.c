//Auto einai to tetarto script
//pairnei san eisodo 5 arxeia
//0) to proto proto pou periexei tin original rapl read
//1)to proto pou periexei ta rest rapl reads
//2)to deutero pou periexei to finl rapl read
//3)to trito pou periexei to energy cost tou kathe rapl read
//4)to tetarto pou tha graftei to ananeomeno rest rapl read
//4)to pempto pou tha graftei to ananeomeno last rapl read
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>


int main(int argc, char *argv[]) {


    //MAIN PART 1 : read the files 

    FILE * fp0; //the file we gonna read original rapl read
    char * line0 = NULL;
    size_t len0 = 0;
    ssize_t read0;

    FILE * fp; //the file we gonna read rest rapl reads
    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    FILE * fp1; //the file we gonna last rapl read
    size_t len1 = 0;
    ssize_t read1;

    FILE * fp2; //the first file we read rapl energy cost
    char * line2 = NULL;
    size_t len2 = 0;
    ssize_t read2;

    FILE * fp3; //the file we gonna write updated  rest rapl reads
    char * line3 = NULL;
    size_t len3 = 0;
    ssize_t read3;

    FILE * fp4; //the file we gonna write updated  last rapl read
    char * line4 = NULL;
    size_t len4 = 0;
    ssize_t read4;



    if (argc<6)
        {    //if an argument is not provided then error message and fail 
        fprintf(stderr,"You have not given the name of one ore more argumets\n");
        fprintf(stderr,"Arguments should be in that order :\n 0)to proto proto me to original rapl read 1)to proto me rest rapl reads\n 2)to deutero me last rapl read\n 3)to trito me rapl read cost\n 4)to tetarto pou tha graftei updated rest rapl reads\n 5)to pempro pou tha graftei updated last rapl read");
        return 1;
        }
    fp  = fopen(argv[1], "r"); //1)to proto proto  me original rapl read
    fp  = fopen(argv[2], "r"); //1)to proto me rest rapl reads
    fp1 = fopen(argv[3], "r"); //2)to deutero me last rapl read
    fp2 = fopen(argv[4], "r"); //3)to trito me rapl read cost
    fp3 = fopen(argv[5], "w"); //to tetarto pou tha graftei updated rest rapl reads
    fp4 = fopen(argv[6], "w"); //to pempto pou tha graftei updated last rapl read


    if (fp0 == NULL)
        {
        fprintf(stderr,"Could not open original rapl read file\n");
        exit(EXIT_FAILURE);
        }
    if (fp == NULL)
        {
        fprintf(stderr,"Could not open rest rapl reads file\n");
        exit(EXIT_FAILURE);
        }
    if (fp1 == NULL)
        {
        fprintf(stderr,"Could not open last rapl read file\n");
        exit(EXIT_FAILURE);
        }
    if (fp2 == NULL)
        {
        fprintf(stderr,"Could not open rapl cost file\n");
        exit(EXIT_FAILURE);
        }
    if (fp3 == NULL)
        {
        fprintf(stderr,"Could not open file to output updated rest rapl read\n");
        exit(EXIT_FAILURE);
        }
    if (fp4 == NULL)
        {
        fprintf(stderr,"Could not open file to output updated last rapl read\n");
        exit(EXIT_FAILURE);
        }



    char *code1=NULL, *code2=NULL;
    char *command1=NULL, *command2=NULL , *opcode =NULL;
    char *energy2=NULL , *energy3=NULL ,*energy4=NULL , *energy5=NULL;
    int energy_counter1=0,energy_counter2=0 ,counter =0;
    float weight_total=0 , weight=0 , weight_temp=0, energy_total=0 , energy_temp=0;
    bool is_break = false;

    float cost =0;
    char *energy1 =NULL;
    char *energy_tmp =NULL;
    int num_prv_reads =1;
    float current_read =0, prev_read =0;
    float result=0;


    if((read0 = getline(&line0, &len0, fp0)) != -1){
            prev_read = atof(read0); //read the individual rapl cost
        }

    if((read2 = getline(&line2, &len2, fp2)) != -1){
        cost = atof(read2); //read the individual rapl cost
    }


    while ((read = getline(&line, &len, fp)) != -1)
    {
        energy_tmp= strtok(line, '\n');
        current_read= atof(energy_tmp);
        if (prev_read != current_read) //rapl read energy read has changed
        {
            result = current_read - (num_prv_reads*cost);
            num_prv_reads=1;
            prev_read =current_read;
            fprintf(fp3,"%f\n",result);
        }
        else  //rapl read energy has stayed the same
        {
            num_prv_reads++;
            fprintf(fp3,"%f\n",result);

        }
        




    }

}