#!/bin/bash 

DATAFILE=$1
if [[ ${DATAFILE} == "" ]]; then
   echo "usage: $0 datafile"
   exit 1
fi
PREFIX=DATAFILE="'${DATAFILE}'"

TERMINAL=$2
if [[ ${TERMINAL} != "" ]]; then
  PREFIX+=";set terminal $TERMINAL"
fi

#gnuplot -persist -e "DATAFILE='${DATAFILE}'" $(basename $0 .sh).gp 
gnuplot -persist -e "$PREFIX" $(basename $0 .sh).gp 