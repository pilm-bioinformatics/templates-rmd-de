library("pasilla")
pasCts <- system.file("extdata",
                      "pasilla_gene_counts.tsv",
                      package="pasilla", mustWork=TRUE)
pasAnno <- system.file("extdata",
                       "pasilla_sample_annotation.csv",
                       package="pasilla", mustWork=TRUE)
cts <- as.matrix(read.csv(pasCts,sep="\t",row.names="gene_id"))
coldata <- read.csv(pasAnno, row.names=1)
coldata <- coldata[,c("condition","type")]
rownames(coldata) <- gsub("fb", "", rownames(coldata))

library(org.Dm.eg.db)
rowdata <- select(org.Dm.eg.db, rownames(cts), "SYMBOL", "ENSEMBL")
colnames(rowdata) <- c("gene_id", "gene_name")
rowdata <- dplyr::distinct(rowdata, gene_id, .keep_all = TRUE)
row.names(rowdata) <- rowdata[["gene_id"]]
rowdata <- rowdata[rownames(cts),]
library(SummarizedExperiment)
se = SummarizedExperiment(assays = list(raw=cts[, rownames(coldata)]),
                     colData = coldata,
                     rowData = rowdata)
saveRDS(se, "data/se.rds")
