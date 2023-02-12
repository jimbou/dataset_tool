#!/bin/bash
import sys

lines = []
# read file
with open("best_rapl_rest.txt", 'r') as fp:
    # read an store all lines into list
    lines = fp.readlines()

# Write file
with open("best_rapl_rest.txt", 'w') as fp:
    # iterate each line
    #fp.write("AA"+lines[0])
    for line in lines[0:-1]:
        # delete line 5 and 8. or pass any Nth line you want to remove
        # note list index starts from 0
        fp.write(line)
    #fp.write("AA"+lines[-1])
        