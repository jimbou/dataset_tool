#!/bin/bash
clang -o overhead_remover overhead_remover.c
rm updated_rapl_rest.txt 2> /dev/null
rm updated_rapl_last.txt 2> /dev/null
rm err_log_overhead.txt 2> /dev/null

touch help2.txt 
touch help3.txt 
touch err_log2.txt 

./overhead_remover rapl_original.txt rapl_rest.txt  rapl_last.txt rapl_cost.txt updated_rapl_rest.txt updated_rapl_last.txt #>>err_log_overhead.txt