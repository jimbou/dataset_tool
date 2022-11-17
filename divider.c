//Auto einai to deutero script
//pairnei san eisodo 5 arxeia
//1)auto pou pargetai apo to cleaner.c (ekei pou bgainei to stdout tou cleaner.c)
//2)output for BBs code -ekei tha graftei o kodikas ton bb
//3)output for bb energy- ekei tha graftei i energeia ton bbs
//4)input me energeia arxikou rapl read
//5)input with the rest rapl energies
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>


typedef struct node {
    float val;
    struct node * next;
} node_t;

void print_list(node_t * head) {
    node_t * current = head;

    while (current != NULL) {
        printf("%f\n", current->val);
        current = current->next;
    }
}

void push_last(node_t * head, float val) {
    node_t * current = head;
    while (current->next != NULL) {
        current = current->next;
    }

    /* now we can add a new variable */
    current->next = (node_t *) malloc(sizeof(node_t));
    current->next->val = val;
    current->next->next = NULL;
}

void push_first(node_t ** head, float val) {
    node_t * new_node;
    new_node = (node_t *) malloc(sizeof(node_t));

    new_node->val = val;
    new_node->next = *head;
    *head = new_node;
}

float pop(node_t ** head) {
    float retval = -1;
    node_t * next_node = NULL;

    if (*head == NULL) {
        return -1;
    }

    next_node = (*head)->next;
    retval = (*head)->val;
    free(*head);
    *head = next_node;

    return retval;
}

float remove_last(node_t * head) {
    float retval = 0;
    /* if there is only one item in the list, remove it */
    if (head->next == NULL) {
        retval = head->val;
        free(head);
        return retval;
    }

    /* get to the second to last node in the list */
    node_t * current = head;
    while (current->next->next != NULL) {
        current = current->next;
    }

    /* now current points to the second to last item of the list, so let's remove current->next */
    retval = current->next->val;
    free(current->next);
    current->next = NULL;
    return retval;

}

float remove_by_index(node_t ** head, int n) {
    int i = 0;
    float retval = -1;
    node_t * current = *head;
    node_t * temp_node = NULL;

    if (n == 0) {
        return pop(head);
    }

    for (i = 0; i < n-1; i++) {
        if (current->next == NULL) {
            return -1;
        }
        current = current->next;
    }

    if (current->next == NULL) {
        return -1;
    }

    temp_node = current->next;
    retval = temp_node->val;
    current->next = temp_node->next;
    free(temp_node);

    return retval;

}

int main(int argc, char *argv[]) {


    //MAIN PART 1 : read the file and copy 
    FILE * fp; //the file we gonna read from
    char * line = NULL;
    size_t len = 0;
    ssize_t read;

    FILE * fp1; //the first file we gonna write on 
    char * line1 = NULL;
    size_t len1 = 0;
    ssize_t read1;

    FILE * fp2; //the second file we gonna write on
    char * line2 = NULL;
    size_t len2 = 0;
    ssize_t read2;

    FILE * fp3; //the input file with first rapl read energies
    char * line3 = NULL;
    size_t len3 = 0;
    ssize_t read3;

    FILE * fp4; //the input file with rest rapl read energies
    char * line4 = NULL;
    size_t len4 = 0;
    ssize_t read4;


    float original_read, previous_read , current_read , current_energy;
    const char s[2] = "\n";
    char* token;


    if (argc<5)
        {    //if an argument is not provided then error message and fail 
        fprintf(stderr,"You have not given the name of one ore more argumets\n");
        fprintf(stderr,"Arguments should be in that order :\n 1)cleaner script output file\n 2)output for BBs code\n 3)output for bb energy\n 4)input me energeia arxikou rapl read\n 5)name of input with the rest rapl energies\n");
        return 1;
        }
    fp  = fopen(argv[1], "r"); //to proto argument einai to onoma tou arxeiou me to apotelsma tou cleaner script
    fp1 = fopen(argv[2], "w");//to  deutero to output gia bbs code
    fp2 = fopen(argv[3], "w"); //to trito gia output gia bbs energy
    fp3 = fopen(argv[4], "r"); //to tetarto einai input me enrgeia tou first rapl read
    fp4 = fopen(argv[5], "r"); //to pempto einai input me enrgeia apo rest of rapl reads
    

    if (fp == NULL)
        {
        fprintf(stderr,"Could not open file with output of cleaner script\n");
        exit(EXIT_FAILURE);
        }
    if (fp1 == NULL)
        {
        fprintf(stderr,"Could not open file to output BBs code\n");
        exit(EXIT_FAILURE);
        }
    if (fp2 == NULL)
        {
        fprintf(stderr,"Could not open file to output BBs energy\n");
        exit(EXIT_FAILURE);
        }
    if (fp3 == NULL)
        {
        fprintf(stderr,"Could not open file for input with the first rapl read\n");
        exit(EXIT_FAILURE);
        }
    if (fp4 == NULL)
        {
        fprintf(stderr,"Could not open file for input with the rest rapl reads\n");
        exit(EXIT_FAILURE);
        }

    read3 = getline(&line3, &len3, fp3);
    original_read=atof(line3);
    previous_read=original_read;

//ORISMOS LISTAS

node_t * head = NULL;
head = (node_t *) malloc(sizeof(node_t));
if (head == NULL) {
    return 1;
}


head->val = original_read;
head->next = NULL;


    while ((read4 = getline(&line4, &len4, fp4)) != -1) 
        {
        token = strtok(line4, s);
        current_read= atof(token);
        current_energy = current_read-previous_read; 
        push_last(head,current_energy);
        previous_read=current_read; 
        }
    
    current_energy = pop(&head); 
    print_list(head);
    
    current_energy = pop(&head); 
    
}




