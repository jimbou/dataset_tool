import pandas as pd

# Read the input CSV file into a pandas DataFrame
df = pd.read_csv('results_ram/dirty_csv_files/final_dataset.csv')
print(df)
res = df.set_index(['bb'])['energy'].apply(pd.Series).stack()
res = res.reset_index()
res.columns = ['bb','occurence','energy']
print(df)
print("size of non unique dataset is : ",len(df))
# Remove duplicates and store unique rows in a new DataFrame
#df_unique = df.drop_duplicates()
#data_top = df_unique.head() 
    
# display 
#print(data_top) 
#df_unique.drop(['index','average_energy','occurences'], axis=1)
#df_unique_1=df_unique['BB']

#df_unique_1 = df_unique_1.drop_duplicates()
#data_top = df_unique_1.head() 
#print(data_top)

# Write the unique rows to a new CSV file

df1 = df.groupby(['bb']).mean()
df1.to_csv('results_ram/dirty_csv_files/cleaned_dataset.csv')
print(df1)
print(len(df1))