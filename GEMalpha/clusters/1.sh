#!/bin/bash

# particles
cat ../dados.dat | tail -n 500 | head -n 500 | awk -f 1.awk > 1.svg

# clusters
gcc ahc.c -lm -Ofast && ./a.out final.dat > clust.dat
cat clust.dat | awk -f 2.awk > 2.svg
