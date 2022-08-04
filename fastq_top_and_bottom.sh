#! /usr/bin/sh

# Splits fastq file into two equally sized fastq, placing top half into one output file and bottom half into another.
# Authors: Carlos Peralta, Josué Cerecedo
# UBMI-IFC 2022


out1=$(echo $1 | sed -r 's/\..*/_mitad1\.fq/')
out2=$(echo $1 | sed -r 's/\..*/_mitad2\.fq/')

fqlines=$( wc -l $1 | cut -d ' ' -f 1) 
mitad=$(($fqlines / 2))


head -n $mitad $1 > $out1
tail -n $mitad $1 > $out2
