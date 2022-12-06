#!/bin/bash
cd addresses_folder 
./run_addresses.sh $1
cd ..
cd cost_folder
./run_cost.sh
cd ..
cd remover_folder
./run_remover.sh
cd ..
cd cleaner_folder
./run_cleaner.sh $1
cd ..
cd divider_folder
./run_divider.sh
cd ..
cd breaker_folder
./run_breaker.sh
cd ..