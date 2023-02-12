#!/bin/bash

echo "running git pulles"

git pull 

echo "pulled runner"

cd ../cscripts

git pull

echo "pulled cscripts"

cd ../energy_dataset

git pull

echo "pulled energy_dataset"

cd ../runner
