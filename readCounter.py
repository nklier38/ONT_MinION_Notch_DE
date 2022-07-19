# -*- coding: utf-8 -*-
"""
Created on Sun Feb 13 19:00:51 2022

@author: nklie
"""

from Bio import SeqIO
import csv
header = ['gene accesion', "e1DMSO.sam", "e1DAPT.sam", "e3DMSO.sam", "e3DAPT.sam", "e4DMSO.sam", "e4DAPT.sam", "e5DMSO.sam", "e5DAPT.sam", "e6DMSO.sam", "e6DAPT.sam"]

allGeneList = []
readSizePerGene = {}
geneLengths = {}

allReadLengths = []
allReadProportions = []

def countFromSam(fileDir):
    readCounts = {}
    fullMap = open(fileDir, 'r')
    counter = 0
    count2 = 0
    for mapLine in fullMap:
        count2 += 1
        if not mapLine:
            break
        if not(mapLine[0] == '@'):
            #print(mapLine)
            gene = mapLine.split('\t')[2]
            readLength = len(mapLine.split('\t')[9])
            if len(gene)!=1:
                allReadLengths.append([readLength])
                allReadProportions.append([readLength/geneLengths[gene]])
            
               
            if gene in readCounts:
                readCounts[gene] +=1
                readSizePerGene[gene].append(readLength)
            else:
                counter += 1
                if(counter%1000  ==0):
                    print("read lengths is: " + str(readLength) + ". ref length is: " + str(geneLengths[gene]))
                    print(str(counter) + "new gene identified: " + str(gene))
                    print("currently on read: " + str(count2))
                readCounts[gene] = 0
                readSizePerGene[gene] = [readLength]
                if gene not in allGeneList:
                    allGeneList.append(gene)
    
    fullMap.close()
    return readCounts

def loadAllGeneLengths(refFile):
    ref = SeqIO.parse(open(refFile),'fasta')
    for fasta in ref:
         name, sequence = fasta.id, str(fasta.seq)
         geneLengths[name] = len(sequence)
    print(len(geneLengths))
    print("beta actin length: " +str(geneLengths['NM_001101']))
    
    
    
def formatWrite(analyzed, filename):
   with open(filename, "w", newline='') as analyzedFile:
      writer = csv.writer(analyzedFile)
      writer.writerows(analyzed)  
      
if __name__ == '__main__':
    loadAllGeneLengths('refMrna.fa')
    readCountDicts = []
    fileTable = [header]
    for barcode in ("e1DMSO.sam", "e1DAPT.sam", "e3DMSO.sam", "e3DAPT.sam", "e4DMSO.sam", "e4DAPT.sam", "e5DMSO.sam", "e5DAPT.sam", "e6DMSO.sam", "e6DAPT.sam"):
        readCountDicts.append(countFromSam(barcode))
        
    for gene in allGeneList:
        
        row = [gene]
        for BC in readCountDicts:
            if gene in BC:
                row.append(BC[gene])
            else:
                row.append(0)
        fileTable.append(row)
    for x in range(0, 50):
        print(fileTable[x])
    formatWrite(fileTable, 'countTable.csv')
    formatWrite(allReadLengths, 'lengths.csv')
    formatWrite(allReadProportions, 'proportions.csv')
    
