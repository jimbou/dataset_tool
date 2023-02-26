import sys
import statistics
#pyhton script to give addresses of rapl functions
energy =[]
new_energy=[]
new_unchanged_energy=[]
energy_rest =[]
energy_last=[]
unchanged_energy =[]
beg_list =[]
end_list=[]
beg_un_list =[]
end_un_list=[]
orig_diff_list =[]
orig_un_diff_list =[]
overhead_list=[]

with open("values_file.txt", 'a') as f5:
    for i in range (1,52):
        file_write_average = open("average_value.txt", "w")
        file_write_last = open("best_rapl_last.txt", "w")
        file_write_first_last =open("best_first_last_rapl.txt", "w")
        file_read_original = open("rapl_original_"+str(i)+".txt", "r")
        #file_read_original_unchanged = open("rapl_original_unchanged_"+str(i)+".txt", "r")       
        #file_read_original_unchanged_new = open("rapl_original_unchanged_new_"+str(i)+".txt", "r")
        #file_read_original_unchanged_new_f = open("rapl_original_unchanged_new_f_"+str(i)+".txt", "r")
        file_read_rest = open("rapl_rest_"+str(i)+".txt", "r")
        #file_read_last = open("rapl_last_"+str(i)+".txt", "r")
        #file_read_unchanged = open("first_last_rapl_"+str(i)+".txt", "r")
        file_read_beg_end = open("rapl_beg_end_"+str(i)+".txt", "r")

        lines_original = file_read_original.readlines()
        #lines_original_unchanged = file_read_original_unchanged.readlines()
        #lines_original_unchanged_new = file_read_original_unchanged_new.readlines()
        #lines_original_unchanged_new_f = file_read_original_unchanged_new_f.readlines()
        lines_rest = file_read_rest.readlines()
        #lines_last = file_read_last.readlines()
        #lines_unchanged = file_read_unchanged.readlines()
        lines_beg_end = file_read_beg_end.readlines()

        #original_value = float(lines_original[0][:-1])
        #last_value = float(lines_last[0][:-1])
        #rest_1= float(lines_rest[0][:-1])
        #rest_2= float(lines_rest[-1][:-1]) 
        orig = float(lines_original[0][:-1])
        #orig_un= float(lines_original_unchanged[0][:-1]) 
        #orig_un_new= float(lines_original_unchanged_new[0][:-1]) 
        #orig_un_new_f= float(lines_original_unchanged_new_f[0][:-1]) 
        


        beg_un= float(lines_beg_end[0][:-1])
        end_un= float(lines_beg_end[1][:-1]) 
        beg=  float(lines_rest[0][:-1])
        end= float(lines_rest[-1][:-1]) 

        orig_diff = beg-orig
        #orig_un_diff= beg_un - orig_un
        #overhead = orig_un_new - orig_un_new_f


        #overhead_list.append(overhead)
        #orig_diff_list.append(orig_diff)
        #orig_un_diff_list.append(orig_un_diff)
        beg_list.append(beg)
        beg_un_list.append(beg_un)
        end_list.append(end)
        end_un_list.append(end_un)

        

        num =len(lines_rest)

        diff_beg_end = end -beg
        diff_beg_end_un  = end_un - beg_un

        diff_total = diff_beg_end- diff_beg_end_un
        new_rapl_cost = diff_total/(num-1)
        #file_write_original.write(str(new_rapl_cost)+"\n")

        #diff_rest = (rest_2-rest_1)/(num-1) 
        #diff_last =last_value-rest_2
         
       


        #unchanged_first = float(lines_unchanged[0][:-1]) 
        #unchanged_last = float(lines_unchanged[1][:-1]) 

        #print("original value is ", original_value)
        #print("last value is ", last_value)
        #print("number of rest is ", num)

        #print("unchanged_first value is ", unchanged_first)
        #print("unchanged_last value is ", unchanged_last)
        #energy_passed = last_value-original_value
        #energy_unchanged=unchanged_last-unchanged_first
        #energy_interm =  rest_2 - original_value
    
        #energy_diff =energy_passed-energy_unchanged
        #rapl_cost = energy_diff/(num+1)
        f5.write("Current " +str(i)+ " : "+str(new_rapl_cost)+"\n")
        #f5.write("TOTAL : "+str(rapl_cost)+"\n")
        #f5.write("REST : "+str(diff_rest)+"\n")
        #f5.write("LAST : "+str(diff_last)+"\n")

        
        new_energy.append(diff_beg_end)
        new_unchanged_energy.append(diff_beg_end_un)
        #energy.append(energy_passed)
        #energy_rest.append(diff_rest)
        #energy_last.append(diff_last)

        #unchanged_energy.append(energy_unchanged)
    med_beg_end =  statistics.median(new_energy)
    med_beg_end_un =  statistics.median(new_unchanged_energy)
    av_beg_end_un = statistics.mean(new_unchanged_energy)
    #med_overhead =statistics.median(overhead_list)
    #med_orig =statistics.median(orig_diff_list)
    
    #med_true = med_orig - med_overhead
    
    #med_last = statistics.median(energy_last)
    #med_rest = statistics.median(energy_rest)
    #med_energy =statistics.median(energy)
    #med_unchanged_energy = statistics.median(unchanged_energy)
    #energy_diff = med_energy-med_unchanged_energy
    new_energy_diff = med_beg_end- med_beg_end_un
    new_rapl_cost_1 = new_energy_diff/(num-1)
    #rapl_cost = energy_diff/(num+1)
    f5.write("total "+str(i)+ " : "+str(new_rapl_cost_1)+"\n")
    f5.write("num "+str(i)+ " : "+str(num-1)+"\n")
    file_write_average.write("AVERAGE :"+ str(av_beg_end_un) +" \n")
    file_write_average.write("Our energy :"+ str(med_beg_end_un) +" \n")
    real_diff = abs(av_beg_end_un -med_beg_end_un)
    perc_diff = real_diff/av_beg_end_un
    file_write_average.write("Real difference :"+ str(real_diff) +" \n")
    file_write_average.write("Percentage difference :"+ str(perc_diff) +" \n")

    #f5.write("Total Final :" + str(rapl_cost)+"\n")
    #f5.write("REST Final : "+str(med_rest)+"\n")
    #f5.write("Last Final : "+str(med_last)+"\n")
    index=new_energy.index(med_beg_end)
    index_un = new_unchanged_energy.index(med_beg_end_un)
    #index_overhead = overhead_list.index(med_overhead)
    #best_orig_diff = orig_diff_list[index]
    #best_orig_un_diff = orig_un_diff_list[index_un]
    best_beg = beg_list[index]
    best_beg_un = beg_un_list[index_un]
    best_end = end_list[index]
    best_end_un = end_un_list[index_un]
    #best_overhead= overhead_list[index_overhead]
    #f5.write("orig diff "+str(index)+ " : "+str(best_orig_diff)+"\n")
    #f5.write("orig un_diff "+str(index_un)+ " : "+str(best_orig_un_diff)+"\n")
    #f5.write("overhead "+str(index_overhead)+ " : "+str(best_overhead)+"\n")
    #f5.write("true diff "+ " : "+str(med_true)+"\n")
    #file_write_original.write(str(best_beg)+"\n")
    
    #file_write_original.write(str(best_beg)+"\n")
    #file_write_original.write (str(best_end)+"\n")
    file_write_last.write(str(best_end)+"\n")
    file_write_first_last.write(str(best_beg_un)+"\n"+str(best_end_un)+"\n")

    print("ENERGY=\""+ str(index+1)+"\"")
    print("ENERGY_UNCHANGED=\""+ str(index_un+1)+"\"")




    