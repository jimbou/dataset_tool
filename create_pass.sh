#!/bin/bash

rm -r build 2> /dev/null
mkdir build
cd build
cmake ..
make
cd ..

