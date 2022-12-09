#!/bin/bash
 
 ./total.sh $1
 cp -r $1_results/ ../cscripts/
 rm -r $1_results/
 
 cd ../cscripts
 cp $1_results/* run_folder/
 ./total.sh $1
 rm -r $1_results/
 rm run_folder/trace.txt
rm run_folder/trace_un.txt
mkdir $1_results
mv breaker_folder/breaker_code.txt $1_results
mv breaker_folder/breaker_clean_energy.txt $1_results