pkgs <- c(
    "DESeq2",
    "DEGreport",
    "pheatmap",
    "tidyverse",
    "RColorBrewer",
    "rmarkdown",
    "knitr",
    "devtools",
    "stringr",
    "ashr"
)


ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
fnd <- pkgs %in% ap
pkgs_to_install <- pkgs

ok <- BiocManager::install(pkgs_to_install, update=FALSE, ask=FALSE) %in% rownames(installed.packages())

BiocManager::install("pilm-bioinformatics/rmdCore", update=FALSE, ask=FALSE)


if (!all(fnd))
    message("Packages not found in a valid repository (skipped):\n  ",
            paste(pkgs[!fnd], collapse="  \n  "))
if (!all(ok))
    message("Failed to install:\n  ",
         paste(pkgs_to_install[!ok], collapse="  \n  "))

# suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))
