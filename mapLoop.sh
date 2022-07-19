#!/bin/bash

for barcode in *.fastq
do
	/home/nklier/fullBackupDL/tools/minimap2/minimap2 -ax map-ont --secondary=no refMrna.fa $barcode > ${barcode}.sam
	
done




