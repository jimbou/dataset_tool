/* A key/value dict system in C */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dict.c"


int main(int argc, char **argv) {
    /* Create a dict */
    dict_t **dict = dictAlloc();
    
    /* lets add foo, and bar to the dict */
    addItem(dict, "foo", "10");
    addItem(dict, "bar", "11");
    
    /* and print their values */
    printf("%s %s\n", (char *)getItem(*dict, "foo"), (char *)getItem(*dict, "bar"));
    
    char *value ;   // o xaraktiras aston opoio tha diabasoume tin timi tis  energias
    int true_value;  // o int me tin energeia
    value = (char *)getItem(*dict, "foo"); //diabazoume apo leksiko
    sscanf(value, "%d", &true_value); // metatrepoume ton charactira se int
    printf("You entered: %d \n", true_value);

    /* lets delete them */
    delItem(dict, "foo");
    delItem(dict, "bar");
    
    /* see, their gone, there NULL */
    printf("%s %s\n", (char *)getItem(*dict, "foo"), (char *)getItem(*dict, "bar"));
    
    /* add them again to proof it works */
    addItem(dict, "foo", "bar");
    addItem(dict, "bar", "foo");
    addItem(dict, "bar", "pan");
    
    /* see, here */
    printf("%s %s\n", (char *)getItem(*dict, "foo"), (char *)getItem(*dict, "bar"));
    
    delItem(dict, "foo");
    delItem(dict, "bar");
    
    dictDealloc(dict);
    
    return 0;
}

