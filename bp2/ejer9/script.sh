#!/bin/bash

for ((P=1;P<=4;P=P+1))
do
    export OMP_NUM_THREADS=$P
    echo -e "\n - Para $P threads:"
    ./ejer9a 25000
done