#!/bin/bash
echo "starting.."
 ./total_uncore.sh $1
 echo "done with total"
 cp -r $1_results_uncore/ ../cscripts/
 rm -r $1_results_uncore/
 cp -r  $1_folder/ results_uncore/
 rm -r $1_folder/
 cd ../cscripts
 cp $1_results_uncore/* run_folder/
 ./total.sh $1 #allo total apo to cscripts
 rm -r $1_results_uncore/
 rm run_folder/trace.txt
rm run_folder/trace_un.txt
mkdir $1_results_uncore
mv breaker_folder/breaker_code.txt $1_results_uncore
mv breaker_folder/breaker_final_energy.txt $1_results_uncore
mv breaker_folder/evaluation.txt $1_results_uncore
mv breaker_folder/evaluation_real.txt $1_results_uncore
mv run_folder/average_value.txt $1_results_uncore
cp -r $1_results_uncore ../energy_dataset/results_uncore
cp -r $1_results_uncore results_uncore
rm -r $1_results_uncore

cd ../energy_dataset
#./clean_data.sh $1