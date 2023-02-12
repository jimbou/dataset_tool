#!/bin/bash
rm rapl_cost.txt 2> /dev/null
python3 calculate_rapl_cost.py rapl_original.txt rapl_rest.txt rapl_last.txt first_last_rapl.txt >> rapl_cost.txt