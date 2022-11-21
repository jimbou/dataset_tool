#!/bin/bash
#this is the sh that find the enrgy cost of each rapl read 
rm help_rapl.txt 2> /dev/null


touch help_rapl.txt 

python3 rapl_energy.py rapl_original.txt rapl_rest.txt rapl_last.txt rapl_clean.txt help_rapl.txt
