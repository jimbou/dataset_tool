#!/bin/bash
clang -o cleaner cleaner.c
rm help1.txt
rm err_log.txt
./cleaner  a_static code_assembly_foo_rapl_addresses.txt >> help1.txt 2>err_log.txt