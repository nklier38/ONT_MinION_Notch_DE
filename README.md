# ONT_MinION_Notch_DE
Python, R scripts, and Bash scripts associated with the Master's Thesis "Comparison of an Oxford Nanopore Technologies Sequencing Platform to Existing Sequencing Methods for Differential Expression Studies"


PYTHON SCRIPTS

quant.py: mimics functionality of RsubRead, but allows greater flexibility in input file. Was implemented to specifically address alignment directly to a transcriptome. RsubREad expects a genomic .sam or .bam file and an additional gtf file. This script expects just a .sam file aligned to a transcriptome.

R SCRIPTS

DESeqRun.R: runner script for DESeq2. Includes loading data, normalizing data, and outputting data as a csv. 
edgerRunner.R: Runner script for edgeR. Includes loading data and outputting data as a csv. 
genHistograms.R: used to generate histograms for length and proportions of mapped reads.
scatter.R: used to generate a smoothened scatterplot to correlate gene length with read coverage.

BASH SCRIPTS

mapLoop.sh: simple script to run minimap2 on all fastq files within a directory directly to a mRNA reference. 
mapLoopGenomic.sh: simple script to run minimap2 on all fastq files within a directory to a genomic reference. 
chopLoop.sh: simple script to run  porechop on all fastq files within a directory.

