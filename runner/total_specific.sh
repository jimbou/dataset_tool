#!/bin/bash

cp results/$1_folder/$1.c .
cp results/$1_folder/$1_unchanged.c .
cp results/$1_folder/find_multiple_trace.sh .
cp results/$1_folder/calculate_multiple_rapl_cost.py .

./total_project.sh $1

rm $1.c
rm $1_unchanged.c

mv $1* results/$1_folder/
rm find_multiple_trace.sh
rm calculate_multiple_rapl_cost.py

