#!/usr/bin/bash
# Bowtie2 stats reports iterator and parser
# Carlos Peralta  | GitHub: cperalta22 | cperalta@ifc.unam.mx
# Instituto de Fisiología Celular, Universidad Nacional Autonoma de Mexico
# GPL3
# 2023

if [ $# -lt 1 ];
then
    echo "Este script requiere un argumento para funcionar; el path de un directorio"
    exit
fi

echo ">sample,total_reads,paired,%paired,unaligned,%unaligned,aligned_1_time,%aligned_1_time,multialigned,%multialigned,%overal_aligment"
for f in $1/*; do
    sed 's/^\W*//' $f >tmp.tmp
    samp=$(echo $f| rev | cut -d '/' -f 1 | rev)
    treads=$(head --lines 1 tmp.tmp | cut -f 1 -d ' ')
    tpair=$(sed -n '2p' tmp.tmp| cut -f 1 -d ' ')
    ppair=$(sed -n '2p' tmp.tmp| cut -f 2 -d ' '| sed 's/[()%]//g')
    tunalign=$(sed -n '3p' tmp.tmp| cut -f 1 -d ' ')
    punalign=$(sed -n '3p' tmp.tmp| cut -f 2 -d ' '| sed 's/[()%]//g')
    tsingalign=$(sed -n '4p' tmp.tmp| cut -f 1 -d ' ')
    psingalign=$(sed -n '4p' tmp.tmp| cut -f 2 -d ' '| sed 's/[()%]//g')
    tmultialign=$(sed -n '5p' tmp.tmp| cut -f 1 -d ' ')
    pmultialign=$(sed -n '5p' tmp.tmp| cut -f 2 -d ' '| sed 's/[()%]//g')
    palign=$(sed -n '15p' tmp.tmp| cut -f 1 -d ' '| sed 's/[%]//g')
    rm tmp.tmp
    echo $samp,$treads,$tpair,$ppair,$tunalign,$punalign,$tsingalign,$psingalign,$tmultialign,$pmultialign,$palign
done
