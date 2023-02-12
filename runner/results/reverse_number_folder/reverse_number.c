/*  Example Program For Reverse Number In C Programming Language */

// Header Files
#define _GNU_SOURCE
#include<stdio.h>
#include <stdlib.h>
//#include<conio.h>

//Main Function
void do_nothing(){
  return;
}
int main(int argc, char *argv[])
{
    do_nothing();
    //Varibale Declaration
    long int n,n1,reverse=0;
    for (int i=0;i<10;i++){
    printf("Enter the Number:");
   sscanf(argv[1], "%ld", &n);

    while(n!=0)
    {
        n1=n%10;
        reverse=reverse*10+n1;
        n=n/10;
    }
    printf("Reverse Number Is :%ld",reverse);
    // Wait For Output Screen
    //getch();
    }
    //Main Function return Statement
    do_nothing();
    return 0;
}

void rapl_A() {
	char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int data;

    FILE *fd = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", "r");
    FILE *fd1 = fopen("rapl_rest.txt", "a");

    if (fd == NULL)
      exit(EXIT_FAILURE);

    if (fd1 == NULL)
      exit(EXIT_FAILURE);

    while ((read = getline(&line, &len, fd)) != -1) {
      //Do nothing.
    }
    data= strtoull(line, NULL, 10);
    //printf("old %llu", old);
    //while (data == old ){
      //data = strtoull(line, NULL, 10);
    //}



    if (line)
      free(line);

    fclose(fd);
    fprintf(fd1,"%llu\n", data);
    fclose(fd1);

    return;
}


void rapl_B() {
	char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int data;

    FILE *fd = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", "r");
    FILE *fd1 = fopen("rapl_rest.txt", "a");

    if (fd == NULL)
      exit(EXIT_FAILURE);

    if (fd1 == NULL)
      exit(EXIT_FAILURE);

    while ((read = getline(&line, &len, fd)) != -1) {
      //Do nothing.
    }
    data= strtoull(line, NULL, 10);
    //printf("old %llu", old);
    //while (data == old ){
      //data = strtoull(line, NULL, 10);
    //}



    if (line)
      free(line);

    fclose(fd);
    fprintf(fd1,"%llu\n", data);
    fclose(fd1);

    return;
}

void rapl_C() {
	char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int data;

    FILE *fd = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", "r");
    FILE *fd1 = fopen("rapl_rest.txt", "a");

    if (fd == NULL)
      exit(EXIT_FAILURE);

    if (fd1 == NULL)
      exit(EXIT_FAILURE);

    while ((read = getline(&line, &len, fd)) != -1) {
      //Do nothing.
    }
    data= strtoull(line, NULL, 10);
    //printf("old %llu", old);
    //while (data == old ){
      //data = strtoull(line, NULL, 10);
    //}



    if (line)
      free(line);

    fclose(fd);
    fprintf(fd1,"%llu\n", data);
    fclose(fd1);

    return;
}