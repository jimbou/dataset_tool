#!/bin/bash
 rm -r /results_core/csv_files  2> /dev/null
mkdir /results_core/csv_files
rm -r /results_core/dirty_csv_files  2> /dev/null
mkdir /results_core/dirty_csv_files
 python3 total_average.py
 python3 total_plot.py 
 python3 csv_concat.py
 ./remove_duplicates.sh



