#!/bin/bash

#this script traces  the executable created and stores the result as well as the 
# to a  folder called with the name of the exe

clang -o general_rapl general_rapl.c

for i in {1..101}
do
    rm rapl_original_$i.txt 2> /dev/null
    touch rapl_original_$i.txt

   
    
    rm rapl_last_$i.txt 2> /dev/null
    touch rapl_last_$i.txt

    rm first_last_rapl_$i.txt 2> /dev/null
    touch first_last_rapl_$i.txt

    rm $1_folder/trace_$i.txt 2> /dev/null
    rm trace_$i.txt 2> /dev/null

    rm rapl_rest.txt 2> /dev/null
    touch rapl_rest.txt

    rm rapl_beg_end.txt 2> /dev/null
    touch rapl_beg_end.txt

   


    

    #./general_rapl >> rapl_original_unchanged_new_f_$i.txt #store starting rapl value  of original exe without rapl reads
    #perf record -e intel_pt//u ./general_rapl >> rapl_original_unchanged_new_$i.txt
    #./general_rapl >> rapl_original_unchanged_$i.txt #store starting rapl value  of original exe without rapl reads
    perf record -e intel_pt//u ./$1_folder/$1_unchanged 30 311 7 8 9 11 12 34 5 12 33 55 99 0 81 23 45 65 1 22 13 98 13 12 34 56 68 48 36 20 1 13 15
    mv perf.data perf_un_$i.data 
    #./general_rapl >> first_last_rapl_$i.txt #store finishing rapl value  of original exe without rapl reads
    echo "whatsup"
    ./general_rapl >> rapl_original_$i.txt #store starting rapl value of the pass exe
    perf record -e intel_pt//u ./$1_folder/$1 30 311 7 8 9 11 12 34 5 12 33 55 99 0 81 23 45 65 1 22 13 98 13 12 34 56 68 48 36 20 1 13 15
    #./general_rapl >> rapl_last_$i.txt #store finishing rapl value of the pass exe

    mv perf.data perf_$i.data

    mv rapl_rest.txt rapl_rest_$i.txt
    mv rapl_beg_end.txt rapl_beg_end_$i.txt
    #sleep 2
done
#perf script --insn-trace --xed > trace.txt


