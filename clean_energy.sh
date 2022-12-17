#!/bin/bash

rm -r temp 2> /dev/null
mkdir temp
cp $1_results/breaker_code.txt temp
cp $1_results/breaker_final_energy.txt temp
cp $1_results/evaluation.txt temp


scriptname="$(data_exploration.ipynb)".py

jupyter nbconvert --to script --execute data_exploration && python ${scriptname}
rm ${scriptname}
