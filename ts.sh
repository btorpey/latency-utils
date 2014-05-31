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

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE}) && /bin/pwd)   

gnuplot -persist -e "$PREFIX" ${SCRIPT_DIR}/$(basename $0 .sh).gp 