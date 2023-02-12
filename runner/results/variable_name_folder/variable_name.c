#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*void print(char str[])
{
    printf("String Output: ");
    puts(str);
}*/




void hello() {
   printf("hello world\n");
    return;
}



/*void read_rapl() {
    char *path = "" ; // sublirose to me to sosto path 
    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int old ,data;

    FILE *fd = fopen(path, "r");

    if (fd == NULL)
      exit(EXIT_FAILURE);

    while ((read = getline(&line, &len, fd)) != -1) {
      //Do nothing.
    }
    old = strtoull(line, NULL, 10);
    printf("old %llu", old);
    while (data == old ){
      data = strtoull(line, NULL, 10);  
    }



    if (line)
      free(line);

    fclose(fd);
    printf("%llu", data);
    return ;  
}
*/
void do_nothing(){
  return;
}
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


#define getVariableName(x) #x

int main()

{
    do_nothing();
    for (int j=0;j<35;j++){
    int student_age = 21;
    int a =13;
    float b =123456.889;
    long double c= 1111111111111111111111.1;
    char d='r';
    int long e = 6666666;
    int f =13;
    float g =123456.889;
    long double h= 1111111111111111111111.1;
    char i='r';
    int long j = 6666666;




    printf("value of %s is = %d\n", getVariableName(student_age), student_age);
    printf("value of %s is = %d\n", getVariableName(a), a);
    printf("value of %s is = %f\n", getVariableName(b), b);
    printf("value of %s is = %LF\n", getVariableName(c), c);
    printf("value of %s is = %c\n", getVariableName(d), d);
    printf("value of %s is = %ld\n", getVariableName(e), e);
    printf("value of %s is = %d\n", getVariableName(f), f);
    printf("value of %s is = %f\n", getVariableName(g), g);
    printf("value of %s is = %LF\n", getVariableName(h), h);
    printf("value of %s is = %c\n", getVariableName(i), i);
    printf("value of %s is = %ld\n", getVariableName(j), j);
    }
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



