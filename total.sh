#!/bin/bash
 python3 total_average.py
 python3 total_plot.py 
rm -r csv_files  2> /dev/null
mkdir csv_files
for d in */; do cp "$d"/clean_data.csv csv_files_"$d".csv; done


