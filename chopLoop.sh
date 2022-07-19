#!/bin/bash

for exp in */; do
	echo "$
	exp"
	for fq in $exp/*.fastq; do
		porechop -i $fq -o ${fq}trimmed.fastq
	done
done
