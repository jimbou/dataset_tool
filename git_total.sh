#!/bin/bash

echo "running git pushes"

git add .
git commit -m "$1"
git push origin main 

echo "commited runner"

cd ../cscripts

git add .
git commit -m "$1"
git push origin main

echo "commited cscripts"

cd ../energy_dataset

git add .
git commit -m "$1"
git push origin main

echo "commited energy_dataset"

cd ../runner
