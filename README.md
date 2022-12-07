# Bioinfo_utilities

## UNAM - IFC semi-official toolbox for small bioinformatic tasks

- __basecounter.py__ : python3 script for nucleotide composition and CpG percentage on a given DNA sequence
  - On a console type __python3 basecounter.py__ and follow the instructions
- __promoters_from_gtf.R__ : R script to extract promoters from GTF annotation files 
  - Before execution please modify __Global variables__ as your convinence
  - It can be executed via __Rscript__ or __Rstudio__
- __fastq_top_and_bottom.sh__ Bash script to split in two equal size fastq files, it takes a decompressed fastq file as an argument and writes top half into file and bottom half into another file.

`$ ./fastq_top_and_bottom.sh [[your_file.fastq]]`

- __fastq_splitter.sh__ Similarly to previous script it create two fastq files of equal size from an input, this script places every other read into a different output files.

`$ ./fastq_splitter.sh [[your_file.fastq]]`

- __gtf2bed.sh__ : Bash script that takes as an argument the path for a GTF file and returns all the genomic coordinates in such file in BED format, the Identifier field is **gene_id**
`$ ./gtf2bed.sh [[input GTF]] > [[output BED file]]`

___
