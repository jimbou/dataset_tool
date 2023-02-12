#!/bin/bash

#this script traces  the executable created and stores the result as well as the 
# to a  folder called with the name of the exe

clang -o general_rapl general_rapl.c

rm rapl_original.txt 2> /dev/null
touch rapl_original.txt

rm rapl_last.txt 2> /dev/null
touch rapl_last.txt

rm first_last_rapl.txt 2> /dev/null
touch first_last_rapl.txt

rm rapl_rest.txt 2> /dev/null
touch rapl_rest.txt

rm rapl_beg_end.txt 2> /dev/null
touch rapl_beg_end.txt

rm $1_folder/trace.txt 2> /dev/null
rm trace.txt 2> /dev/null
touch trace.txt

./general_rapl >> first_last_rapl.txt #store starting rapl value  of original exe without rapl reads
./$1_folder/$1_unchanged   
./general_rapl >> first_last_rapl.txt #store finishing rapl value  of original exe without rapl reads

./general_rapl >> rapl_original.txt #store starting rapl value of the pass exe
perf record -e intel_pt//u ./$1_folder/$1
./general_rapl >> rapl_last.txt #store finishing rapl value of the pass exe
perf script --insn-trace --xed > trace.txt

