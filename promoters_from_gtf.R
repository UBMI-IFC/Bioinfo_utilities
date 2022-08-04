# R Script to get gene  promoters in bed format from GTF/GFF file
# Josué Cerecedo , Carlos Peralta

if(!require(data.table)){
    install.packages("data.table")
}
library(data.table)

######## Global Variables

annoFile <- "gencode.v19.annotation.gtf" # Path and name to gtf file 
upstreamRange  <- 2000 # bp to add prior TSS
downstreamRange  <- 1000 # bp to add after TSS
featureID  <- "gene_name" # feature to filter to get Gene Names or Identifiers
OUTPUT  <-  "hg19_promoters.bed" # Path and name of output file

######## Actual Code

gtf <- fread(annoFile) # Reads annotation file
geneTable <- as.data.frame(gtf[gtf$V3 == "gene", ]) # Discard all features but genes

geneTable$V2 = NULL
geneTable$V3 = NULL
geneTable$V6 = NULL
geneTable$V8 = NULL

colnames(geneTable) <- c("chr","start","end","strand","shit")


for (i in 1:nrow(geneTable)){
  if (geneTable$strand[i]=='+'){
      geneTable$end[i]<- geneTable$start[i] + downstreamRange 
      geneTable$start[i]<- geneTable$start[i] - upstreamRange
  }
  else
    {
        geneTable$start[i]<- geneTable$end[i] - downstreamRange
        geneTable$end[i]<- geneTable$end[i] + upstreamRange
  }
}

geneTable$start[geneTable$start<1] <- 1


# If you dont want gene names in your bed file you can comment the following 
###########
geneTable$gene <- "hola"
geneNames <- read.table(text = geneTable$shit, sep = ";", fill = T)
geneNames <- geneNames$V5
geneNames <- geneNames[grepl(featureID , geneNames)]
geneNames <- gsub(featureID , "" , geneNames)
geneTable$gene <- geneNames
############

geneTable$strand = NULL
geneTable$shit = NULL
geneTable <- geneTable[geneTable$chr != "chrM" ,]


write.table(geneTable, file = OUTPUT, quote = F, col.names = F, row.names = F, sep = "\t")


