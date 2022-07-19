#!/bin/bash

echo "differential expression is running"

MAINDIR=$(pwd)
cd RNAdata
for barcode in *; 
do
	echo "merging file:"
	echo ${MAINDIR}/concat/${barcode}.fastq
	cat ./$barcode/*.fastq > ${MAINDIR}/concat/${barcode}.fastq
	echo "____________________________________________"
done

cd $MAINDIR

cd concat


