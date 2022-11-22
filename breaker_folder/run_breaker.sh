#!/bin/bash
clang -o breaker breaker.c
rm breaker_code.txt 2> /dev/null
rm breaker_energy.txt 2> /dev/null
rm breaker_log.txt 2> /dev/null

touch breaker_code.txt 
touch breaker_energy.txt 
touch breaker_log.txt 

./breaker  ../divider_folder/divider_code.txt ../divider_folder/divider_energy.txt breaker_code.txt breaker_energy.txt  2>breaker_log.txt