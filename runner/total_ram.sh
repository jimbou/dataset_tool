#!/bin/bash


#should have created pass first

./run_pass.sh $1
rm average_value.txt 2> /dev/null
touch average_value.txt
./find_multiple_trace.sh $1
./calculate_multiple_rapl_cost.sh $1

rm -r $1_results_ram 2> /dev/null

mkdir $1_results_ram


mv average_value.txt $1_results_ram
mv $1_folder/code_assembly_$1.txt $1_results_ram
mv first_last_rapl.txt $1_results_ram
mv perf.data $1_results_ram
mv rapl_last.txt $1_results_ram
mv rapl_original.txt $1_results_ram
#mv rapl_original_unchanged.txt $1_results_ram
mv rapl_rest.txt  $1_results_ram
mv trace.txt $1_results_ram
mv trace_un.txt $1_results_ram

echo "finished total sh"