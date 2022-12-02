#!/bin/bash


#should have created pass first

./run_pass.sh $1
./find_multiple_trace.sh $1
./calculate_multiple_rapl_cost.sh $1

rm -r $1_results 2> /dev/null

mkdir $1_results
mv $1_folder/code_assembly_faa.txt $1_results
mv first_last_rapl.txt $1_results
mv perf.data $1_results
mv rapl_last.txt $1_results
mv rapl_original.txt $1_results
mv rapl_rest.txt  $1_results
mv trace.txt $1_results