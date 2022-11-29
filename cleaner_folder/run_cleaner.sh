#!/bin/bash
clang -o cleaner cleaner.c
rm trace_clean.txt 2> /dev/null
rm log_cleaner.txt 2> /dev/null
rm missing_opcodes.txt  2> /dev/null
rm final_missing_opcodes.txt  2> /dev/null
touch missing_opcodes.txt
touch final_missing_opcodes.txt
./cleaner  a_static ../run_folder/code_assembly_foo_rapl_addresses.txt  ../run_folder/trace.txt  ../run_folder/opcodes.txt >> trace_clean.txt 2>log_cleaner.txt
python3 find_missing.py missing_opcodes.txt final_missing_opcodes.txt
