#!/bin/bash
clang -o breaker breaker.c
rm help4.txt 2> /dev/null
rm help5.txt 2> /dev/null
rm err_log3.txt 2> /dev/null

touch help4.txt 
touch help5.txt 
touch err_log3.txt 

./breaker  help2.txt help3.txt help4.txt help5.txt  2>err_log3.txt