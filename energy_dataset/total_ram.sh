#!/bin/bash
 rm -r /results_ram/csv_files  2> /dev/null
mkdir /results_ram/csv_files
rm -r /results_ram/dirty_csv_files  2> /dev/null
mkdir /results_ram/dirty_csv_files
 python3 total_average.py
 python3 total_plot.py 
 python3 csv_concat.py
 ./remove_duplicates.sh



