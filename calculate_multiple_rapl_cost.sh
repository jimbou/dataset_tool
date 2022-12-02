#!/bin/bash
rm best_rapl.txt 2> /dev/null
python3 calculate_multiple_rapl_cost.py >>best_rapl.txt

source best_rapl.txt
mv rapl_rest_$ENERGY.txt best_rapl_rest.txt
mv rapl_original_$ENERGY.txt best_rapl_original.txt
mv rapl_last_$ENERGY.txt best_rapl_last.txt
mv first_last_rapl_$ENERGY_UNCHANGED.txt best_first_last_rapl.txt
mv perf_$ENERGY.data best_perf.data


rm first_last_rapl* 2> /dev/null
rm rapl_rest*  2> /dev/null
rm rapl_original* 2> /dev/null
rm rapl_last* 2> /dev/null
rm perf* 2> /dev/null


mv  best_rapl_rest.txt rapl_rest.txt
mv  best_rapl_original.txt rapl_original.txt
mv  best_rapl_last.txt rapl_last.txt
mv  best_first_last_rapl.txt first_last_rapl.txt
mv  best_perf.data perf.data

perf script --insn-trace --xed > trace.txt
rm best_rapl.txt 2> /dev/null