import os
import os.path
import numpy as np
import matplotlib.pyplot as plt

values_true=[]
values_predicted =[]
names=[]
for subdir, dirs, files in os.walk("/home/bbrapl/energy_dataset"):
    for dir in dirs:
        print(dir)
        print(dir+"/evaluation_real.txt")
        if( os.path.isfile(dir+"/evaluation_real.txt") ) and ( os.path.isfile(dir+"/evaluation_predicted.txt") ):
            f=open(dir+"/evaluation_real.txt",'r')
            lines=f.readlines()
            f.close()
            f=open(dir+"/evaluation_predicted.txt",'r')
            lines2=f.readlines()
            f.close()
            line =lines[0].split()
            val= float(line[1])
            values_true.append(val)
            line2 =lines2[0].split()
            # print (line2)
            val2= float(line2[4])
            values_predicted.append(val2)
            names.append(dir[:-8])
print (values_true)
print(values_predicted)
print(names)


  
X_axis = np.arange(len(names))
  
plt.bar(X_axis - 0.2, values_true, 0.4, label = 'Actual')
plt.bar(X_axis + 0.2, values_predicted, 0.4, label = 'Predicted')
  
plt.xticks(X_axis, names)
plt.xlabel("Benchmarks")
plt.ylabel("Energy Sum")
plt.title("Actual energy sum vs Predicted energy sum")
plt.legend()
plt.savefig("plot_total.png")




