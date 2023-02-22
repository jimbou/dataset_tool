#!/bin/bash

cp results_ram/$1_folder/$1.c .
cp results_ram/$1_folder/$1_unchanged.c .
cp results_ram/$1_folder/find_multiple_trace.sh .
cp results_ram/$1_folder/calculate_multiple_rapl_cost.py .

./total_project_ram.sh $1

rm $1.c
rm $1_unchanged.c

mv $1* results_ram/$1_folder/
rm find_multiple_trace.sh
rm calculate_multiple_rapl_cost.py

