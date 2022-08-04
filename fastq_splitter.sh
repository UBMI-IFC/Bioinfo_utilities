#! /usr/bin/bash

# Splits fastq file into two equally sized fastq, placing every other read into a different output file
# Authors: Carlos Peralta, Josué Cerecedo
# UBMI-IFC 2022

count=0
out=0

out1=$(echo $1 | sed -r 's/\..*/_parte1\.fq/')
out2=$(echo $1 | sed -r 's/\..*/_parte2\.fq/')


while read line; do
    if [ $out == 0 ]; then
	echo $line >> $out1
	count=$((count+1))
    else
	echo $line >> $out2
	count=$((count+1))
    fi

    if [ $count == 4 ]; then
	count=0
	if [ $out == 0 ]; then
	    out=1
	else
	    out=0
	fi
    fi

done < $1
