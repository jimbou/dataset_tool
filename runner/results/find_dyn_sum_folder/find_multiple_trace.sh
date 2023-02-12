#!/bin/bash

#this script traces  the executable created and stores the result as well as the 
# to a  folder called with the name of the exe
 echo "Inside multiple trace"
clang -o general_rapl general_rapl.c
    echo "before for"


for i in {1..71}
do
    echo "Inside for"
    rm rapl_original_$i.txt 2> /dev/null
    touch rapl_original_$i.txt

   
    
    rm rapl_last_$i.txt 2> /dev/null
    touch rapl_last_$i.txt

    rm first_last_rapl_$i.txt 2> /dev/null
    touch first_last_rapl_$i.txt

    rm $1_folder/trace_$i.txt 2> /dev/null
    rm trace_$i.txt 2> /dev/null

    rm rapl_rest.txt 2> /dev/null
    touch rapl_rest.txt

    rm rapl_beg_end.txt 2> /dev/null
    touch rapl_beg_end.txt

    

   


    

    #./general_rapl >> rapl_original_unchanged_new_f_$i.txt #store starting rapl value  of original exe without rapl reads
    #perf record -e intel_pt//u ./general_rapl >> rapl_original_unchanged_new_$i.txt
    #./general_rapl >> rapl_original_unchanged_$i.txt #store starting rapl value  of original exe without rapl reads
    echo "before perf"
    perf record -e intel_pt//u ./$1_folder/$1_unchanged 99 2383 886 777 1915 1793 2335 2386 492 2649 421 362 1027 2690 2059 1763 2926 540 426 172 736 1211 368 567 429 782 530 1862 1123 67 1135 929 2802 2022 2058 2069 1167 1393 1456 2011 1042 2229 2373 2421 1919 1784 1537 2198 2324 2315 2370 413 526 91 980 956 873 1862 170 1996 2281 1305 2925 2084 327 2336 1505 1846 729 313 857 2124 2895 582 1545 1814 2367 434 1364 2043 2750 1087 2808 276 1178 788 1584 2403 2651 1754 1399 1932 60 1676 1368 739 1012 226 2586 2094 539
    mv perf.data perf_un_$i.data 
    #./general_rapl >> first_last_rapl_$i.txt #store finishing rapl value  of original exe without rapl reads
    echo "whatsup"
    ./general_rapl >> rapl_original_$i.txt #store starting rapl value of the pass exe
    perf record -e intel_pt//u ./$1_folder/$1 99 2383 886 777 1915 1793 2335 2386 492 2649 421 362 1027 2690 2059 1763 2926 540 426 172 736 1211 368 567 429 782 530 1862 1123 67 1135 929 2802 2022 2058 2069 1167 1393 1456 2011 1042 2229 2373 2421 1919 1784 1537 2198 2324 2315 2370 413 526 91 980 956 873 1862 170 1996 2281 1305 2925 2084 327 2336 1505 1846 729 313 857 2124 2895 582 1545 1814 2367 434 1364 2043 2750 1087 2808 276 1178 788 1584 2403 2651 1754 1399 1932 60 1676 1368 739 1012 226 2586 2094 539
    #./general_rapl >> rapl_last_$i.txt #store finishing rapl value of the pass exe

    mv perf.data perf_$i.data

    mv rapl_rest.txt rapl_rest_$i.txt
    mv rapl_beg_end.txt rapl_beg_end_$i.txt
    #sleep 2
done
#perf script --insn-trace --xed > trace.txt

 echo "finished multiple trace"
