
/*  Example Program For Print 1 to N In C Programming Language
    little drops @ thiyagaraaj.com
    Coded By:THIYAGARAAJ MP             */

// Header Files
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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
    rapl_D();
    int num1, num2, temp;

    printf("Enter the 2 numbers to be swapped : \n");
    sscanf(argv[1], "%d", &num1);
    sscanf(argv[2], "%d", &num2);

    printf("Before Swapping, the values are : \nnum1 = %d\nnum2 = %d\n",num1,num2);

    temp = num1;
    num1 = num2;
    num2 = temp;
     printf("After Swapping, the values are : \nnum1 = %d\nnum2 = %d\n",num1,num2);
    int temp2 =9;
    int temp3 ;
    while (num1>0){
        temp = num1/temp2;
        num1 =temp;
        temp = num2%temp2;
        num2 =temp;
        temp3 = sqrt(num1);
        num1 = ceil(temp3);
        temp3 = sqrt(num2);
        num2 = floor(temp3);
        temp3 = abs(num1);
        temp3 = acos(num1);
        temp3 = asin(num1);
        temp3 = atan(num1);
        temp3 = cbrt(num1);
        temp3 = cos(num1);
        temp3 = exp(num1);
        temp3 = sin(num1);
        temp3 = tan(num1);
        temp3 = pow(num1,8);
        

        



    }
   

  

    rapl_D();
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
