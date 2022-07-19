library(edgeR)

countDF <- read.table("/home/nikola/maindir/pipelines/edgeR/transcriptCounts.csv", sep = ",", header = TRUE, row.names = "Geneid")
group = factor(c("DMSO", "DAPT", "DMSO", "DAPT","DMSO", "DAPT","DMSO", "DAPT","DMSO", "DAPT"))
countData <- DGEList(counts=countDF, group = group)
keep <- filterByExpr(countData)
countData <- countData[keep,,keep.lib.sizes=FALSE]
countData <- calcNormFactors(countData)
design <- model.matrix(~group)
countData <- estimateDisp(countData,design)

et <- exactTest(countData, pair = c("DMSO", "DAPT"))

results <- topTags(et, n = 100000, adjust.method = "BH", sort.by = "PValue", p.value = 1)

write.csv(results, file = "/home/nikola/maindir/pipelines/edgeR/transcriptFC.csv")

head(results)
