#!/bin/bash
rm results_core/csv_files/unique_dataset.csv  2> /dev/null
touch results_core/csv_files/unique_dataset.csv
python3 remove_duplicates.py