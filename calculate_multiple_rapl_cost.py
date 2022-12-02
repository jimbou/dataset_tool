import sys
import statistics
#pyhton script to give addresses of rapl functions
energy =[]
unchanged_energy =[]
with open("values_file.txt", 'a') as f5:
    for i in range (1,12):

        file_read_original = open("rapl_original_"+str(i)+".txt", "r")
        file_read_rest = open("rapl_rest_"+str(i)+".txt", "r")
        file_read_last = open("rapl_last_"+str(i)+".txt", "r")
        file_read_unchanged = open("first_last_rapl_"+str(i)+".txt", "r")

        lines_original = file_read_original.readlines()
        lines_rest = file_read_rest.readlines()
        lines_last = file_read_last.readlines()
        lines_unchanged = file_read_unchanged.readlines()

        original_value = float(lines_original[0][:-1])
        last_value = float(lines_last[0][:-1])


        num =len(lines_rest)


        unchanged_first = float(lines_unchanged[0][:-1]) 
        unchanged_last = float(lines_unchanged[1][:-1]) 

        #print("original value is ", original_value)
        #print("last value is ", last_value)
        #print("number of rest is ", num)

        #print("unchanged_first value is ", unchanged_first)
        #print("unchanged_last value is ", unchanged_last)
        energy_passed = last_value-original_value
        energy_unchanged=unchanged_last-unchanged_first
    
        energy_diff =energy_passed-energy_unchanged
        rapl_cost = energy_diff/(num+1)
        
        f5.write(str(rapl_cost)+"\n")
        
    
        energy.append(energy_passed)
        unchanged_energy.append(energy_unchanged)



    med_energy =statistics.median(energy)
    med_unchanged_energy = statistics.median(unchanged_energy)
    energy_diff = med_energy-med_unchanged_energy
    rapl_cost = energy_diff/(num+1)
    f5.write("Final :" + str(rapl_cost)+"\n")


    print("ENERGY=\""+ str(energy.index(med_energy)+1)+"\"")
    print("ENERGY_UNCHANGED=\""+ str(unchanged_energy.index(med_unchanged_energy)+1)+"\"")



