#!/bin/bash
echo "starting.."
 ./total_ram.sh $1
 echo "done with total"
 cp -r $1_results_ram/ ../cscripts/
 rm -r $1_results_ram/
 cp -r  $1_folder/ results_ram/
 rm -r $1_folder/
 cd ../cscripts
 cp $1_results_ram/* run_folder/
 ./total_ram.sh $1 #allo total apo to cscripts
 rm -r $1_results_ram/
 rm run_folder/trace.txt
rm run_folder/trace_un.txt
mkdir $1_results_ram
mv breaker_folder/breaker_code.txt $1_results_ram
mv breaker_folder/breaker_final_energy.txt $1_results_ram
mv breaker_folder/evaluation.txt $1_results_ram
mv breaker_folder/evaluation_real.txt $1_results_ram
mv run_folder/average_value.txt $1_results_ram
cp -r $1_results_ram ../energy_dataset/results_ram
cp -r $1_results_ram results_ram
rm -r $1_results_ram

cd ../energy_dataset
#./clean_data.sh $1