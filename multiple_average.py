#!/bin/bash
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tqdm

if (len(sys.argv) <2) :
    print("Did not provide enough arguments for python script multiple_average.py")



bbs = {}

#Reading basic block data
path =str(sys.argv[1]) +"_results/breaker_code.txt"
with open(path) as fIn:
    for line in tqdm.tqdm(fIn, desc='Read file'):
        #line start with "@" symbols the begging of a new basic block
        if line[0] == "@":
            bb_name = line.split()[-1].rstrip(":")
            bbs[bb_name] = []
        else:
            bbs[bb_name].append(line.split("=")[0].rstrip())