#!/bin/bash
echo "starting.."
 ./total.sh $1
 echo "done with total"
 cp -r $1_results/ ../cscripts/
 rm -r $1_results/
 cp -r  $1_folder/ results/
 rm -r $1_folder/
 cd ../cscripts
 cp $1_results/* run_folder/
 ./total.sh $1 #allo total apo to cscripts
 rm -r $1_results/
 rm run_folder/trace.txt
rm run_folder/trace_un.txt
mkdir $1_results
mv breaker_folder/breaker_code.txt $1_results
mv breaker_folder/breaker_final_energy.txt $1_results
mv breaker_folder/evaluation.txt $1_results
mv breaker_folder/evaluation_real.txt $1_results
mv run_folder/average_value.txt $1_results
cp -r $1_results ../energy_dataset/
cp -r $1_results results
rm -r $1_results

cd ../energy_dataset
#./clean_data.sh $1