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

  __bowtie2_report_parser.sh__ : takes as an argument a path to a directory that contains the bowtie2 aligment scores (must be saved via redirection of stderr to a file during bowtie2 execution, example: `bowtie2 [[rest of bowtie2 command]] 2> given_sample_bowtie_report.txt`), currently it parses __ALL__ files into a directory, so in order to work properly; the path given as argument __must only contain the report files__.  The script returns a comma separated table of most of the numeric values contained on the reports. 

`$ ./bowtie2_report_parser.sh [[path/to/report/directory]] > [[output_table.csv]] `


___
