



// Header Files
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#define ARRAY_SIZE 30

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

// main function


int binarySearch(int array[], int x, int low, int high) {
  // Repeat until the pointers low and high meet each other
  while (low <= high) {
    int mid = low + (high - low) / 2;

    if (array[mid] == x)
      return mid;

    if (array[mid] < x)
      low = mid + 1;

    else
      high = mid - 1;
  }

  return -1;
}

int main(void) {
    do_nothing();
  int array[100];
 for (int i =0 ;i<100;i++){
    array[i]=i*i+9;
 }
 
  int n = sizeof(array) / sizeof(array[0]);
  int x = array[76];
  int result = binarySearch(array, x, 0, n - 1);
  if (result == -1)
    printf("Not found");
  else
    printf("Element is found at index %d", result);
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



