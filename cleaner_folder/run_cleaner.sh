#!/bin/bash
clang -o cleaner cleaner.c
rm trace_clean.txt 
rm log_cleaner.txt
./cleaner  a_static ../run_folder/code_assembly_foo_rapl_addresses.txt  ../run_folder/trace_sample.txt  ../run_folder/opcodes.txt >> trace_clean.txt 2>log_cleaner.txt