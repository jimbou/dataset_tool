# Python Program to Print Lines
# Containing Given String in File
import sys
# input file name with extension
#file_name = input("Enter The File's Name: ")
  
# using try catch except to
# handle file not found error.
  
# entering try block

# opening and reading the file 
file_read = open(str(sys.argv[1]), "r")
# asking the user to enter the string to be 
# searched
function1 ="<print_1>"  #the first rapl function
function2 ="<print_2>"  #the second rapl function
function3 ="<print_3>"  #the second rapl function


# reading file content line by line.
lines = file_read.readlines()
result1 = ""
result2 = ""
result3 = ""
break1 =False
break2= False
break3=False
# looping through each line in the file
for line in lines:
      
    # if line have the input string, get the index 
    # of that line and put the
    # line into newly created list 
    if (function1 in line) and (break1==False) :
        words = line.split()
        for idx, x in enumerate(words):
            if x == "call" and words[idx+2] == function1:
                result1 =words[idx+1]
                print("Result1 is ", result1 ," between words "  , x ,"  and ", words[idx+2],"\n")
                break1=True
        
    if (function2 in line) and (break2==False) :
        words = line.split()
        for idx, x in enumerate(words):
            if x == "call" and words[idx+2] == function2:
                result2 =words[idx+1]
                print("Result2 is ", result2 ," between words " , x ,"  and ", words[idx+2],"\n")
                break2=True

    if (function3 in line) and (break3==False) :
        words = line.split()
        for idx, x in enumerate(words):
            if x == "call" and words[idx+2] == function3:
                result3 =words[idx+1]
                print("Result3 is ", result3 ," between words " , x ,"  and ", words[idx+2],"\n")
                break3=True
        

 
# closing file after reading
file_read.close()

new_file_str = str(sys.argv[1][:-4]+ "_rapl_addresses.txt")


with open(new_file_str, 'w') as f:

    print("1 ",result1,"\n", file=f)
    print("2 ",result2,"\n", file=f)
    print("3 ",result3,"\n", file=f)

