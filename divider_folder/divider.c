//Auto einai to deutero script
//pairnei san eisodo 6 arxeia
//1)auto pou pargetai apo to cleaner.c (ekei pou bgainei to stdout tou cleaner.c)
//2)output for BBs code -ekei tha graftei o kodikas ton bb
//3)output for bb energy- ekei tha graftei i energeia ton bbs
//4)input me energeia arxikou rapl read
//5)input with the rest rapl energies
//6)input with the last rapl read energy
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

    FILE * fp3; //the input file with first rapl read energy
    char * line3 = NULL;
    size_t len3 = 0;
    ssize_t read3;

    FILE * fp4; //the input file with rest rapl read energies
    char * line4 = NULL;
    size_t len4 = 0;
    ssize_t read4;

    FILE * fp5; //the input file with last rapl read energy
    char * line5 = NULL;
    size_t len5 = 0;
    ssize_t read5;

    float original_read,final_read, previous_read , current_read , current_energy , current_weight, current_total_weight , current_total_energy;
    const char s[2] = "\n";
    char* token;

    char* command_weight =NULL;
    char* temp =NULL;
    char* temp1 =NULL;
    char* temp2 =NULL;


    if (argc<6)
        {    //if an argument is not provided then error message and fail 
        fprintf(stderr,"You have not given the name of one ore more argumets\n");
        fprintf(stderr,"Arguments should be in that order :\n 1)cleaner script output file\n 2)output for BBs code\n 3)output for bb energy\n 4)input me energeia arxikou rapl read\n 5)input with the rest rapl energies\n 6)input me last rapl read energy\n");
        return 1;
        }
    fp  = fopen(argv[1], "r"); //to proto argument einai to onoma tou arxeiou me to apotelsma tou cleaner script
    fp1 = fopen(argv[2], "w");//to  deutero to output gia bbs code
    fp2 = fopen(argv[3], "w"); //to trito gia output gia bbs energy
    fp3 = fopen(argv[4], "r"); //to tetarto einai input me enrgeia tou first rapl read
    fp4 = fopen(argv[5], "r"); //to pempto einai input me enrgeia apo rest of rapl reads
    fp5 = fopen(argv[6], "r"); //to pempto einai input me enrgeia apo last of rapl read
    

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
    if (fp5 == NULL)
        {
        fprintf(stderr,"Could not open file for input with the last rapl read\n");
        exit(EXIT_FAILURE);
        }

    read3 = getline(&line3, &len3, fp3);
    read5 = getline(&line5, &len5, fp5);
    final_read = atof(line5);;
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

node_t * weight = NULL;
weight = (node_t *) malloc(sizeof(node_t));
if (weight == NULL) {
    return 1;
}


weight->val = 0;
weight->next = NULL;


node_t * total_weight = NULL;
total_weight = (node_t *) malloc(sizeof(node_t));
if (total_weight == NULL) {
    return 1;
}
total_weight->val = 0;
total_weight->next = NULL;

node_t * total_energy = NULL;
total_energy = (node_t *) malloc(sizeof(node_t));
if (total_energy == NULL) {
    return 1;
}
total_energy->val = 0;
total_energy->next = NULL;


    while ((read4 = getline(&line4, &len4, fp4)) != -1) 
        {
        token = strtok(line4, s);
        current_read= atof(token);
        current_energy = current_read-previous_read; 
        push_last(head,current_energy);
        previous_read=current_read; 
        }
    
    current_energy = pop(&head); 
    push_last(head,final_read-previous_read);
    printf("LIST OF RAPL ENERGIES IS :\n");
    print_list(head);
    
    
    //edo i lista head periexei oles tis energeis anamesa se rapl reads
    int counter = 0; //autos o counter tha antistoixizei kathe bb me tin eenrgeia tou
    while ((read = getline(&line, &len, fp)) != -1) 
        { 
        if (strchr(line, '@') != NULL)
        {
        temp1= strtok(line,"@"); 
        temp2= strtok(NULL,"\n");
        current_weight=atof(temp2);
        push_last(weight,current_weight);

        }
        }
        current_weight = pop(&weight);
        printf("LIST OF WEIGHT IS :\n");
        print_list(weight);


    //edo i lasta weight periexei ola ta bari ton bb

    node_t * list_head = head ;
    node_t * list_weight = weight ;
    float temp_head ,temp_weight ,total_temp_weight;
    

    while ((list_head != NULL) && (list_weight != NULL))
    {
        temp_head = list_head->val;
        temp_weight = list_weight->val;
        total_temp_weight = total_temp_weight +temp_weight;
        if (temp_head != 0)
        {   push_last(total_energy,temp_head);
            push_last(total_weight,total_temp_weight );
            total_temp_weight=0;
        }
        list_head= list_head->next; 
        list_weight =list_weight->next;
        

    }
    printf("LIST OF TOTAL WEIGHT IS :\n");
    float not_important = pop(&total_weight);
    print_list(total_weight);

     //Edo i lista total_weight exei simplirothei : auti perixei ta total weigths gia polla bb pou apoteloun ena rapl read interval

    printf("LIST OF TOTAL ENERGY IS :\n");
    not_important = pop(&total_energy);
    print_list(total_energy);
    
    //Edo i lista total_energy exei simplirothei :auti periexei tin energeia pou antistoixei se ena energy interval
    
    
    current_total_weight = pop(&total_weight);
    current_total_energy = pop(&total_energy);
    

    //fprintf(fp2, "%f %f \n", current_total_weight, current_total_energy);
    float result;
    
    char type_of_rapl_read= 'A'; 
    fp  = fopen(argv[1], "r");
    fprintf(fp1,"B@ %d\n",counter);
     while ((read = getline(&line, &len, fp)) != -1)  
        {
            
        //opote blep rapl read ama mpika se nao inteval annaneono ta current_total_energy kai current_total_weight
        //allios xrhsimopoio auta tou interval pou eimai tora kai me basi to baros tou torinou bb xorizo tin energeia tou interval
        //pou eimai tora gia na paei kapoia sto bb pou eimai tora 
            if (strchr(line, 'A') != NULL)  
            {
                type_of_rapl_read ='A';
            }
            else if (strchr(line, 'B') != NULL)  
            {
                type_of_rapl_read ='B';
            }
            else if (strchr(line, 'C') != NULL) 
            {
                type_of_rapl_read ='C';
            }
            else
            {
                type_of_rapl_read = 'L';
            }

            if((strchr(line, '@') != NULL))
            {
                current_weight = pop(&weight);
                current_energy = pop(&head);
                result = (current_weight / current_total_weight ) * current_total_energy; 
                fprintf(fp2,"%c@ %d %f %f %f \n",type_of_rapl_read, counter, current_weight , current_total_weight,  result);
                counter++;
                if (strchr(line, 'L') == NULL) {//dn einai to teleutaio rapl read  
                fprintf(fp1,"%c@ %d\n",type_of_rapl_read,counter);}
                else {fprintf(fp1,"L@ %d\n",counter);}

                if (current_energy != 0)
                {
                current_total_energy = pop(&total_energy);
                current_total_weight = pop(&total_weight);
            }
            
            


            
            

            }
            else
            {
                //temp= strtok(line,"-");  //the command is splitted into the actual command
                //command_weight =strtok(NULL,"\n"); //and its weight
                fprintf(fp1,"%s",line);

            }
        
        }

    
}




