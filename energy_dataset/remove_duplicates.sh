#!/bin/bash
rm csv_files/unique_dataset.csv  2> /dev/null
touch csv_files/unique_dataset.csv
python3 remove_duplicates.py