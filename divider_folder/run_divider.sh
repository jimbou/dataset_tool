#!/bin/bash
clang -o divider divider.c
rm divider_code.txt 2> /dev/null
rm divider_energy.txt 2> /dev/null
rm divider_log.txt 2> /dev/null

touch divider_code.txt 
touch divider_energy.txt 
touch divider_log.txt 

./divider  ../cleaner_folder/trace_clean.txt divider_code.txt divider_energy.txt ../run_folder/rapl_original.txt ../remover_folder/updated_rapl_rest.txt ../remover_folder/updated_rapl_last.txt >>divider_log.txt