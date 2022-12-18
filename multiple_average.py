#!/bin/bash
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tqdm
from numpy import mean

if (len(sys.argv) <2) :
    print("Did not provide enough arguments for python script multiple_average.py")



bbs = {}

#Reading basic block data
path =str(sys.argv[1]) +"_results/breaker_code.txt"
path2=str(sys.argv[1]) +"_results/breaker_final_energy.txt"
path3=str(sys.argv[1]) +"_results/evaluation_real.txt"
path4=str(sys.argv[1]) +"_results/evaluation_predicted.txt"
path5=str(sys.argv[1]) +"_results/evaluation.png"
path6=str(sys.argv[1]) +"_results/clean_data.csv"

with open(path) as fIn:
    for line in tqdm.tqdm(fIn, desc='Read file'):
        #line start with "@" symbols the begging of a new basic block
        if line[0] == "@":
            bb_name = line.split()[-1].rstrip(":")
            bbs[bb_name] = []
        else:
            bbs[bb_name].append(line.split("=")[0].rstrip())

bbs_energy = {}

#Reading basic block data
with open(path2) as fIn:
    for line in tqdm.tqdm(fIn, desc='Read file'):
        #line start with "@" symbols the begging of a new basic block
        line = line.split(":")
        bb_name = line[0].split()[-1]
        bbs_energy[bb_name] = float(line[-1].strip())

bbs_df = pd.DataFrame({"bb_name": bbs.keys(), "bb": bbs.values()})
bbs_energy_df = pd.DataFrame({"bb_name": bbs_energy.keys(), "energy": bbs_energy.values()})

df = bbs_df.merge(bbs_energy_df, on="bb_name", how="inner")
print(f"Number of basic blocks with energies for program: {len(df)}")

grouped_df = df.groupby(df["bb"].map(tuple))["energy"].apply(list).reset_index()


data = {'BB': [],
        'average_energy': [],
        'occurences':[]
        }

averaged_energies = pd.DataFrame(data)
for index, row in grouped_df.iterrows():
        new_df = pd.DataFrame({'BB':[row['bb']],'average_energy':mean(row['energy']),'occurences':len(row['energy'])})
        averaged_energies= pd.concat([averaged_energies, new_df], axis=0, ignore_index=True)

clean_energies =averaged_energies[averaged_energies['average_energy']>0].reset_index()
clean_energies.to_csv(path6)

file_read = open(path3, "r")
lines = file_read.readlines()
line =lines[0].split()
val= float(line[1])
print("val is", val)
total_val=0

for index, row in clean_energies.iterrows():
    total_val=total_val+ row['occurences']*row['average_energy']
print("total_val is", total_val)

X = ['Actual vs Predicted']
actual = [val]
predicted = [total_val]
  
X_axis = np.arange(len(X))
  
plt.bar(X_axis - 0.2, actual, 0.4, label = 'Actual')
plt.bar(X_axis + 0.2, predicted, 0.4, label = 'Predicted')
  
plt.xticks(X_axis, X)
plt.xlabel("Groups")
plt.ylabel("Energy Sum")
plt.title("Actual energy sum vs Predicted energy sum")
plt.legend()
plt.savefig(path5)

file_write = open(path4, "w")
file_write.write("Calculated energy sum : "+str(total_val)+"\n")
file_write.write("Difference from real: "+str(((total_val-val)/val )*100)+" %" +"\n")
file_write.write("Number of commands "+ str(len(clean_energies.index))+"\n")




