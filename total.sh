#!/bin/bash
 rm -r csv_files  2> /dev/null
mkdir csv_files
 python3 total_average.py
 python3 total_plot.py 
 python3 concat_csv.py



