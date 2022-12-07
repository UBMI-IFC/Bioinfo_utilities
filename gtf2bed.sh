#! /usr/bin/bash

#Carlos Peralta 2022
#GPL3 

# Takes a GTF as an argument and return a BED file using the gene_id field as identifier
# usage ./gtf2bed.sh {GTF file} > {output BED file}

cut -f 1,4,5 $1 > tmp3colBed
grep -Eo "gene_id[^;]+" $1 | sed 's/gene_id "//' | sed 's/"//' > tmpIds
paste tmp3colBed tmpIds
rm tmp*
