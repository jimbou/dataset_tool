#!/bin/bash

#this script passes the c source code through the pass produces exe  and 
#the resulting exe is dissasemlied

clang -S -emit-llvm $1.c
llvm-as $1.ll

llc -filetype=obj $1.bc
clang  -o $1_unchanged $1.o  -O0 -static 

opt -load build/skeleton/libSkeletonPass.* -skeleton < $1.bc > $1_inst.bc  -enable-new-pm=0  2> code_ll_$1.txt # to enable new pm mono locally oxi ston server
llc -filetype=obj  $1_inst.bc 
llvm-dis -o $1-debug.ll $1_inst.bc 
clang  -o $1 $1_inst.o  -O0 -static 
chmod +x $1
 echo "Creation of modified  executable successfull"

objdump -d $1 > code_assembly_$1.txt

rm -r $1_folder 2> /dev/null
mkdir $1_folder
cp code_assembly_$1.txt $1_folder
mv -t $1_folder $1.ll $1.bc $1 $1_inst.bc $1_inst.o $1_unchanged $1-debug.ll $1.o  
