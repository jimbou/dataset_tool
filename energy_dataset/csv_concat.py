import os
import pandas as pd
#THIS IS THE NEW ONE
# Set the directory where the CSV files are located
dir_path = '/home/jim/dataset_tool/energy_dataset/csv_files'

# Create an empty list to store the CSV file paths
csv_files = []
df = pd.DataFrame()
temp = pd.DataFrame()
# Loop through all files in the directory
for file in os.listdir(dir_path):
    if file.endswith('.csv'):
        # If the file is a CSV file, add its path to the list
        csv_files.append(os.path.join(dir_path, file))
print(csv_files)
# Concatenate all CSV files into a single DataFrame
#df = pd.concat([pd.read_csv(f) for f in csv_files])
for f in csv_files:
    temp = pd.read_csv(f)
    print(len(temp))
    df=pd.concat([df,temp])

# Save the concatenated DataFrame to a new CSV file
df.to_csv('/home/jim/dataset_tool/energy_dataset/csv_files/final_dataset.csv', index=False)

dir_path = '/home/jim/dataset_tool/energy_dataset/dirty_csv_files'

# Create an empty list to store the CSV file paths
csv_files = []
df = pd.DataFrame()
temp = pd.DataFrame()
# Loop through all files in the directory
for file in os.listdir(dir_path):
    if file.endswith('.csv'):
        # If the file is a CSV file, add its path to the list
        csv_files.append(os.path.join(dir_path, file))
print(csv_files)
# Concatenate all CSV files into a single DataFrame
#df = pd.concat([pd.read_csv(f) for f in csv_files])
for f in csv_files:
    temp = pd.read_csv(f)
    print(len(temp))
    df=pd.concat([df,temp])

# Save the concatenated DataFrame to a new CSV file
df.to_csv('/home/jim/dataset_tool/energy_dataset/dirty_csv_files/final_dataset.csv', index=False)