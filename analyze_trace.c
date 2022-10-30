/* A key/value dict system in C */
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include "dict.c"

char * registers [] = { "%eax" , "%ebx" ,"%ecx", "%edx", "%cs", "%ds", "%es", "%fs", "%gs", "%ss","%esi", "%edi" , "%ebp", "%eip" ,"%esp", "%ax", "%bx", "%cx" , "%dx" ,"%ah" ,"%al" ,"%bh" ,"%bl" , "%ch" ,"%dh" ,"%dl" ,"%rax", "%rcx" ,"%rdx" ,"%rbx" ,"%rsp" ,"%rbp" ,"%rsi" ,"%rdi" ,"%sp" ,"%bp" ,"%si" ,"%di" ,"%spl" ,"%bpl" ,"%sil" ,"%dil" , "%ss" ,"%cs" ,"%ds" ,"%es" ,"%fs" ,"%gs" ,"%eflags" ,"%eip","%r8", "%r9","%r10", "%r11", "%r12","%r13", "%r14","%r15","%r8d", "%r9d","%r10d", "%r11d", "%r12d","%r13d", "%r14d","%r15d", "%r8w", "%r9w","%r10w", "%r11w", "%r12w","%r13w", "%r14w","%r15w","%r8b", "%r9b","%r10b", "%r11b", "%r12b" ,"%r13b", "%r14b", "%r15b"}; //size =49


bool StartsWith(const char *a, const char *b)
{
   if(strncmp(a, b, strlen(b)) == 0) return 1;
   return 0;
}




char* give_opcode(char *argument, char *line)  //returns the name of the command in our format 
{
  
        //printf("Retrieved line of length %zu:\n") read);
        //printf("%s", line);

        char *p = NULL;
        char *p1 =NULL;
        char *p2 =NULL;
        char *opcode =NULL;
        char *op1 =NULL;
        char *op2 =NULL;
        char *op3 =NULL;
        char *temp =NULL;
        char *temp2 =NULL;
        char Delimit[] = " ,";
        char *arg1 =NULL;
        char *arg2 =NULL;
        char *arg3 =NULL;
        bool arg1reg =false;
        bool arg2reg =false;
        bool arg3reg =false;


        
        p = strstr(line, argument);
        
        p1 = strtok(p," ");   
        p2 =strtok(NULL,"\n"); //periexei tin actuall entoli me kena stin arxi
        while (isspace(*p2)){
            ++p2;}             //katharizoume ta kena stin arxi
        printf("%s \n",  p2); 
        opcode  =strtok(p2,Delimit); //pairnoume to onoma tis entolis
        if (opcode != NULL) {   //pairnoume proto operator
            op1 = strtok(NULL, Delimit); }
        if (op1!= NULL) {       //pairnoume deutero operator
            op2 = strtok(NULL,Delimit); }
        if (op2!= NULL) {       //pairnoume trito operator
            op3= strtok(NULL,Delimit); }


        //Now starts the categorizing opcodes part
        //first we check if the operators are in the register list
        if (op1!= NULL) {
            for(int i = 0; i < 82; ++i)
            {
                if(!strcmp(registers[i], op1))
                    {
                    arg1reg=true;
                    //printf("rgister \n");
                    }
            } 
        }
        if (op2!= NULL) {
            for(int i = 0; i < 82; ++i)
            {
                if(!strcmp(registers[i], op2))
                    {
                    arg2reg=true;
                    //printf("rgister \n");
                    }
            } 
        }
        if (op3!= NULL) {
            for(int i = 0; i < 82; ++i)
            {
                if(!strcmp(registers[i], op3))
                    {
                    arg3reg=true;
                    //printf("rgister \n");
                    }
            } 
        }


        //Now we do all the checking 

         if (op1== NULL) {
            arg1 = "0";
         }
         else if(arg1reg){
            arg1 = "r";
         }
         else if ((strchr(op1, '(') != NULL) && (strchr(op1, ')') != NULL))
         {
            arg1 = "m";
         }
         else if(StartsWith(op1, "<") && (strlen(op1) > 2 && !strcmp(op1 + strlen(op1) - strlen(">"), ">"))) //to starts with einai ama arxizei i leski me substring , to deutero kommati einai an teleionei se sugekkrimeno char
         {
            arg1 = "m";
         }
         else if (StartsWith(op1, "%"))
         {
            arg1 = "m";
         }
          else if (StartsWith(op1, "$0x"))
         {
            arg1 = "I";
         }
         else if (!strcmp(op1, "%cl"))
         {
            arg1 ="cl";
         }
         else 
         {
            printf("could not find type of op1 \n");
            arg1="0";
         }
         
        printf ("Type of op1 %s is %s \n",op1 ,arg1);

        
        printf("%s %s %s %s\n",  opcode , op1, op2 ,op3);
        return opcode;
    
}
int main(int argc, char *argv[]) {
    
    
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen("trace.txt", "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);
    if (argc<2 ){                //if an argument is not provided then error message and fail 
        printf("You have not given the name of the file that was executed \n");
        return 1;}
    else{
        strcat(argv[1] ,") ");   //this will be the telling where the gerbage stops and where actuall commands start
       }

    while ((read = getline(&line, &len, fp)) != -1) {
        //printf("Retrieved line of length %zu:\n", read);
        //printf("%s", line);
        char *result =NULL;
        result =give_opcode(argv[1],line);

        printf("Result is %s \n",  result);
    }

        fclose(fp);
        if (line)
        free(line);
    exit(EXIT_SUCCESS);
    
    
    return 0;
}

