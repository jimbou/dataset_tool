/*  Example Program For Print 1 to N In C Programming Language
    little drops @ thiyagaraaj.com
    Coded By:THIYAGARAAJ MP             */

// Header Files
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

void rapl_D() {
	char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int data;

    FILE *fd = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", "r");
    FILE *fd1 = fopen("rapl_beg_end.txt", "a");

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

//Main Function
void do_nothing(){
  return;
}
int main(int argc, char *argv[])
{
    do_nothing();
	int number,i;
	
	printf("Enter the Number:");
	sscanf(argv[1], "%d", &number);
	printf("Print Numbers Up to %d :\n",number);

	for(i=1;i<=number;i++)
		printf("%d\n", i);

    // Wait For Output Screen
    //getch();

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
