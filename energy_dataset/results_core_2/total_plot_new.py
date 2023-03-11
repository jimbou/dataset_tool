import os
import os.path
import numpy as np
import matplotlib.pyplot as plt
from statistics import mean

values_true=[]
values_predicted =[]
names=[]
percentages =[]
cur_dir = os.getcwd()
for subdir, dirs, files in os.walk(cur_dir):
    for dir in dirs:
        print(dir)
        print(dir+"/average_value.txt")
        if( os.path.isfile(dir+"/average_value.txt")  ):
            f=open(dir+"/average_value.txt",'r')
            lines=f.readlines()
            f.close()
            #f=open(dir+"/evaluation_predicted.txt",'r')
            #lines2=f.readlines()
            #f.close()
            line =lines[0].split(":")
            val= float(line[1])
            values_true.append(val)
            line2 =lines[1].split(":")
            line3 =lines[3].split(":")
            # print (line2)
            val2= float(line2[1])
            values_predicted.append(val2)
            val3= float(line3[1])
            percentages.append(abs(val3))
            names.append(dir[:-8])

print (values_true)
print(values_predicted)
print(names)
print(percentages)

av_true = mean(values_true)
av_pred = mean(values_predicted)
av_perc = mean(percentages)




  
X_axis = np.arange(len(names))
plt.subplots_adjust(top =0.94, bottom =0.30) 
plt.bar(X_axis - 0.2, values_true, 0.4, label = 'Actual')
plt.bar(X_axis + 0.2, values_predicted, 0.4, label = 'Predicted')
plt.xticks(rotation = 90)
plt.xticks(X_axis, names)
plt.xlabel("Benchmarks")
plt.ylabel("Energy Sum")
plt.title("Actual energy sum vs Predicted energy sum")
plt.legend()
plt.savefig("plot_total.png")



plt.figure()
plt.subplots_adjust(top =0.94, bottom =0.30)
new_X_axis = np.arange(len(names))
  
plt.bar(new_X_axis , percentages, 0.4, label = 'Percentages')
  
plt.xticks(new_X_axis, names)
plt.xticks(rotation = 90)
plt.xlabel("Benchmarks")
plt.ylabel("Energy Sum")
plt.title("Percentage difference of predicted vs Actual")
plt.legend()
plt.savefig("plot_total_perc.png")


X = ['Actual vs Predicted Averages']
actual =[]
actual = [av_true]

predicted =[]
predicted = [av_pred]


X_axis = np.arange(len(X))
plt.figure()
plt.bar(X_axis - 0.2, actual, 0.4, label = 'Actual')
plt.bar(X_axis + 0.2, predicted, 0.4, label = 'Predicted')

plt.xticks(X_axis, X)
plt.xlabel("Groups")
plt.ylabel("Energy Sum")
plt.title("Average of Actual energy sum vs Average of Predicted energy sum")
plt.legend()
plt.savefig("plot_total_average.png")

X = ['Actual vs Predicted average percentage change']
actual =[]
actual = [av_perc]


X_axis = np.arange(len(X))
plt.figure()
plt.bar(X_axis - 0.2, actual, 0.4, label = 'Percentage change')

plt.xticks(X_axis, X)
plt.xlabel("Groups")
plt.ylabel("Energy Percentage diff average")
plt.title("Average difference percentage of  Actual energy  vs  Predicted energy ")
plt.legend()
plt.savefig("plot_total_average_perc.png")

print(av_perc)