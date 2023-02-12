#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main() {
    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    unsigned long long int data;

    FILE *fd = fopen("/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj", "r");
    //FILE *fd1 = fopen("rapl_rest.txt", "w");

    if (fd == NULL)
      exit(EXIT_FAILURE);

    //if (fd1 == NULL)
      //exit(EXIT_FAILURE);

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
    printf("%llu\n", data);
    //fclose(fd1);

    return 0;  
}
