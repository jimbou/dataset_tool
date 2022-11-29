#!/bin/bash

#this script traces  the executable created and stores the result as well as the 
# to a  folder called with the name of the exe

rm rapl_original.txt 2> /dev/null
touch rapl_original.txt

rm rapl_last.txt 2> /dev/null
touch rapl_last.txt

rm first_last_rapl.txt 2> /dev/null
touch first_last_rapl.txt

./general_rapl >> first_last_rapl.txt #store starting rapl value  of original exe without rapl reads
./$1_unchanged  
./general_rapl >> first_last_rapl.txt #store finishing rapl value  of original exe without rapl reads

clang -o general_rapl general_rapl.c
./general_rapl >> rapl_original.txt #store starting rapl value of the pass exe
perf record -e intel_pt//u ./$1
./general_rapl >> rapl_last.txt #store finishing rapl value of the pass exe
perf script --insn-trace --xed > trace.txt
cp trace.txt $1