
#BiocManager::install("DESeq2")
install.packages("dplyr")
library(DESeq2)
library(dplyr)

countDF <- read.table("/home/nikola/maindir/pipelines/dataJune/DAPTcount/countsGeneNames.csv", sep = ",", header = TRUE)

countDF <- distinct(countDF, GeneName, .keep_all = TRUE)

genes <- countDF[,1]
row.names(countDF) <- genes
countDF[,1] <- NULL

colData <- data.frame(condition=factor(c("DMSO","DAPT","DMSO","DAPT","DMSO","DAPT","DMSO","DAPT","DMSO","DAPT")))

deObj <- DESeqDataSetFromMatrix(countData = countDF, colData = colData, design = ~ condition)
deObj <- estimateSizeFactors(deObj)
normCounts <- counts(deObj, normalized=TRUE)
deObj <- DESeq(deObj)
res <-results(deObj)
write.table(res, file="/home/nikola/maindir/pipelines/dataJune/DAPTcount/resultsTable.csv", sep=",", quote=F, col.names=NA)
res
