import os
import glob
import pandas as pd
os.chdir("/home/jim/dataset_tool/energy_dataset/results_ram/csv_files")

extension = 'csv'
all_filenames = [i for i in glob.glob('*.{}'.format(extension))]
#combine all files in the list
combined_csv = pd.concat([pd.read_csv(f) for f in all_filenames ])
#export to csv
combined_csv.to_csv( "/results_ram/csv_files/final_dataset.csv", index=False, encoding='utf-8-sig')