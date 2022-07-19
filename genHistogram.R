reads = read.csv("/home/nikola/maindir/pipelines/histograms/lengths.csv")
 
readList=list()  

for(i in 1:ncol(reads)) {      
  readList[[i]] <- reads[ , i]    
}

lst2 <- unlist(readList, use.names = FALSE)
hist(lst2, xlim = c(0,5000), breaks = 500, xlab = "Read length (bp)", main = "Histogram of Read Lengths", col = "steelblue1")


props = read.csv("/home/nikola/maindir/pipelines/histograms/proportions.csv")
propList=list()  

for(i in 1:ncol(props)) {      
  propList[[i]] <- props[ , i]    
}

lst3 <- unlist(propList, use.names = FALSE)
hist(lst3, xlim = c(0, 2), breaks = 1000, xlab = "Fraction of total gene length", main = "Histogram of Read Lengths as a Fraction of their mapped Gene Size", col = "orchid1")