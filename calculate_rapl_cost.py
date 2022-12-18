import sys
#pyhton script to give addresses of rapl functions
if (len(sys.argv) <5) :
    print("Did not provide enough arguments for python script find_missing.py")

file_read_original = open(str(sys.argv[1]), "r")
file_read_rest = open(str(sys.argv[2]), "r")
file_read_last = open(str(sys.argv[3]), "r")
file_read_unchanged = open(str(sys.argv[4]), "r")



lines_original = file_read_original.readlines()
lines_rest = file_read_rest.readlines()
lines_last = file_read_last.readlines()
lines_unchanged = file_read_unchanged.readlines()

#print("original value is ", lines_original[0][:-1])
#print("last value is ", lines_last[0][:-1])
#print("number of rest is ", len(lines_rest))

#print("unchanged_first value is ", lines_unchanged[0][:-1])
#print("unchanged_last value is ",lines_unchanged[1][:-1])

original_value = float(lines_original[0][:-1])
last_value = float(lines_last[0][:-1])
rest_1= float(lines_rest[0][:-1])
rest_2= float(lines_rest[-1][:-1])

#for line in lines_last :
    #last_value = float(line[-1])

num =len(lines_rest)
diif_rest = (rest_2-rest_1)/(num-1)


unchanged_first = float(lines_unchanged[0][:-1]) 
unchanged_last = float(lines_unchanged[1][:-1]) 

print("original value is ", original_value)
print("last value is ", last_value)
print("number of rest is ", num)

print("unchanged_first value is ", unchanged_first)
print("unchanged_last value is ", unchanged_last)
energy_passed = last_value-original_value
energy_unchanged=unchanged_last-unchanged_first
print ("energy of passed ",energy_passed)
print ("energy of unchanged ", energy_unchanged)

energy_diff = energy_passed-energy_unchanged
rapl_cost = energy_diff/(num+1)
print("rapl cost " ,rapl_cost )



