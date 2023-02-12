#!/bin/bash


for i in {1..111}
do
    

    rm rapl_original_unchanged_new_$i.txt 2> /dev/null
    touch rapl_original_unchanged_new_$i.txt

    rm rapl_original_unchanged_new_f_$i.txt 2> /dev/null
    touch rapl_original_unchanged_new_f_$i.txt
    
    ./general_rapl >> rapl_original_unchanged_new_f_$i.txt #store starting rapl value  of original exe without rapl reads
    perf record -e intel_pt//u ./general_rapl >> rapl_original_unchanged_new_$i.txt
done
python3 calculate_cost.py >>best_cost.txt
rm rapl_original_unchanged_new_*