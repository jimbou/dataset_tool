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
int main() {
    int a;
    a=9;
    //scanf("%d", &a);
    if (a>2){
    hello();   
    }
    else{
      hello();
      printf("hello world_2\n");   
    }
    return 0;
}


void print_1() {
    printf("Basic Block : \n");
    printf("Energy: 15\n");
    return;

}

void print_2() {
        printf("Energy2: 15\n");
    return;

}

void print_3() {
        printf("Energy2: 15\n");
    return;

}