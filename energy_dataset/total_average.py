import os
import os.path
import numpy as np
import matplotlib.pyplot as plt
import sys
import pandas as pd
import tqdm
from numpy import mean

values_true=[]
values_predicted =[]
names=[]

cur_dir = os.getcwd()
useful_count =0

for subdir, dirs, files in os.walk(cur_dir):
    for dir in dirs:
        if( os.path.isfile(dir+"/evaluation_real.txt") ) :
            print(dir)
            path =dir +"/breaker_code.txt"
            path2=dir +"/breaker_final_energy.txt"
            path3=dir +"/evaluation_real.txt"
            path4=dir +"/evaluation_predicted.txt"
            path5=dir +"/evaluation.png"
            path6=dir +"/clean_data.csv"
            path7=dir +"/average_value.txt"
            path8=cur_dir+"/csv_files/"+dir+".csv"
            

            bbs = {}

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

            bbs_df = pd.DataFrame()
            bbs_df = pd.DataFrame({"bb_name": bbs.keys(), "bb": bbs.values()})
            bbs_energy_df = pd.DataFrame()
            bbs_energy_df = pd.DataFrame({"bb_name": bbs_energy.keys(), "energy": bbs_energy.values()})

            df = pd.DataFrame()
            df = bbs_df.merge(bbs_energy_df, on="bb_name", how="inner")
            print(f"Number of basic blocks with energies for program: {len(df)}")

            grouped_df= pd.DataFrame()
            grouped_df = df.groupby(df["bb"].map(tuple))["energy"].apply(list).reset_index()


            data = {'BB': [],
                    'average_energy': [],
                    'occurences':[]
                    }
            
            averaged_energies =  pd.DataFrame()
            averaged_energies = pd.DataFrame(data)
            for index, row in grouped_df.iterrows():
                    new_df = pd.DataFrame({'BB':[row['bb']],'average_energy':mean(row['energy']),'occurences':len(row['energy'])})
                    averaged_energies= pd.concat([averaged_energies, new_df], axis=0, ignore_index=True)

            total_count =len(averaged_energies.index)

            clean_energies = pd.DataFrame()
            clean_energies =averaged_energies[averaged_energies['average_energy']>0].reset_index()
            non_zero_count = len(clean_energies.index)
            clean_energies.to_csv(path6)
            clean_energies.to_csv(path8)

            file_read = open(path3, "r")
            lines = file_read.readlines()
            line =lines[0].split()
            val =0
            val= float(line[3])
            print("actual val is", val)
            total_val=0

            file_read = open(path7, "r")
            lines = file_read.readlines()
            line =lines[0].split(":")
            average_value =0
            average_value= float(line[1])
            print("average val is", average_value)
            

            for index, row in clean_energies.iterrows():
                total_val=total_val+ row['occurences']*row['average_energy']
            print("total calculated val is", total_val)

            X = ['Actual vs Predicted']
            actual =[]
            actual = [average_value]
            
            predicted =[]
            predicted = [total_val]
            
            
            X_axis = np.arange(len(X))
            plt.figure()
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
            file_write.write("Difference from real: "+str(((total_val-average_value)/average_value )*100)+" %" +"\n")
            file_write.write("Total unique basic blocks : "+ str(total_count)+"\n")
            file_write.write("Non Zero unique basic blocks : "+ str(non_zero_count)+"\n")
            file_write.write("Zero unique basic blocks : "+ str(total_count - non_zero_count)+"\n")
            useful_count+= non_zero_count

print("Usable non zero dataset so far = " ,useful_count)




