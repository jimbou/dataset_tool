import sys
import statistics
#pyhton script to give addresses of rapl functions
my_list =[]
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
#print ("energy of passed ",energy_passed)
#print ("energy of unchanged ", energy_unchanged)

    energy_diff = energy_passed-energy_unchanged
    rapl_cost = energy_diff/(num+1)
#print("rapl cost " ,rapl_cost )
    my_list.append(rapl_cost)

#print(my_list)
med =statistics.median(my_list)
print("MYVARIABLE=\""+ str(my_list.index(med))+"\"")



