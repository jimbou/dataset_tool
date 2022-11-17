#!/bin/bash
clang -o divider divider.c
rm help2.txt 2> /dev/null
rm help3.txt 2> /dev/null
rm err_log2.txt 2> /dev/null

touch help2.txt 
touch help3.txt 
touch err_log2.txt 

./divider  help1.txt help2.txt help3.txt rapl_original.txt rapl_rest.txt >>err_log2.txt