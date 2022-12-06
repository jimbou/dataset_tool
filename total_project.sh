#!/bin/bash
 
 ./total.sh $1
 cp -r $1_results/ ../cscripts/
 rm -r $1_results/
 
 cd ../cscripts
 cp faa_results/* run_folder/
 ./total.sh $1
 rm -r $1_results/
 rm run_folder/trace.txt
rm run_folder/trace_un.txt