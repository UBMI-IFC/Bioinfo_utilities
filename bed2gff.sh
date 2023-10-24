#!/usr/bin/bash

# SIMPLY BED TO GFF CONVERTER
#
# Carlos Peralta 
# Instituto de Fisiologia Celular, UNAM
# GPL3
#
# Takes a Bed and convert it as a GFF asumes that its a BED file of a single type of features
# by default the TYPE (GFF column 3) is set to "peak" the ATTRIBUTES column (GFF 9) is -
# is populated with a unique consecutive attribute named "Peak" and a "bedID" that takes the - 
# of the name column of the BED file (if exist). Only the first 6 columns of the BED file are
# considered, any extra information will be lost on this conversion tool. 
#
# A minimum of 3 columns are required on the input file. 
#
# Columns 4-6 of the BED file are optional but if you need info for the 5-6 columns all the 
# previous columns must be present. 

# Stdout colors 
error=`tput setaf 1`
info=`tput setaf 2`
warn=`tput setaf 3`
colorbg=`tput setab 1`
reset=`tput sgr0`
noinfo=false
typeg="peak"
featureg="peak"

while getopts i:xt:f:h flag
do
    case $flag in
	i) inputfile=$OPTARG;;
	x) noinfo=true;;
	t) typeg=$OPTARG;;
	f) featureg=$OPTARG;;
	h) echo
	   echo "${warn}BED to GFF Converter: ${reset}"
     echo ""
     echo "Basic usage:"
	   echo "${info}bed2gff.sh -i[[input bed file]]${reset}"
     echo ""
     echo "Additional options"
	   echo "${info}-x ---- Ignore 4th trough 6th BED file columns${reset}"
     echo "${info}-t ---- Type column information (default: peak)${reset}"
     echo "${info}-f ---- Feature column information (default: peak)${reset}"
	   echo "${info}-h ---- Show this message${reset}"
	   echo
	   exit;;
  *) echo "${error}Run bed2gtf.sh -h for help" 
     exit;;
    esac
done

# Check that input file is provided
if [ -z $inputfile ];
  then
    echo "${error}ERROR: This script requires an input file" 
    echo ""
    echo "    ${info}bed2gff -i [[input bed file]]" 
    echo ''
    echo "${error}Run bed2gtf.sh -h for help" 
    exit
elif [ -f $inputfile ]; 
  then
    >&2 echo "${info}File exist"
    cat $inputfile | sed -e 's/\t/%/g' > bed.b2g
    colcount=$(head -1 bed.b2g | tr -cd "%" | wc -c) 
    if [ $colcount -lt 2 ]; then
      >&2 echo "${error}$(($colcount+1)) columns detected; 3 is the minimum required"
      exit
    elif [[ $noinfo == true ]]; then
      >&2 echo "${error}$(($colcount+1)) columns detected: But -x argument was passed, only first 3 columns will be used"
    elif [ $colcount -gt 5 ]; then
      >&2 echo "${warn}$(($colcount+1)) columns detected: only the first 6 columns will bee taken in account" 
    else
      >&2 echo "${info}$(($colcount+1)) columns detected"
    fi
else
    echo "${error}ERROR: Input file does not exist, check spelling/path" 
    echo ""
    echo "${error}Run bed2gtf.sh -h for help" 
    exit
fi

# Xargs usando pipes dentro de xargs  
# seq 1 10  |  xargs -I {} sh -c  "cut -f {} -d % tmp.bed | wc -w"

# crea stdout con secuencia numerica basada en el numero de lineas de otro archivo
# seq $(wc -l tmp.bed | cut -f 1 -d ' ') 
