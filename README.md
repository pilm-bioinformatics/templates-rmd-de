# templates-rmd-de
Differential expression analysis template


# Quick start

Download the repository and get inside:

    cd pilm-bioiformatics/templates-rmd-de
    

## Run insde R:

    dir.create("test")
    rmarkdown::render("main.Rmd",
      params = list(se_file = "data/se.rds",
                    output_dir = "test",
                    contrast = list(c("condition", "treated", "untreated"),
                                    c("type", "paired-end", "single-read"))),
      output_dir = "test",
      output_file = "de.html")

Modify parameters to match your data.

## Run from command line

    R -f run_test.R

## Run with docker

    docker run -v `pwd`:/mnt/analysis -ti --user bioc \
        pilm-bioinformatics/templates-rmd-de R -e  \ 
        "setwd('/mnt/analysis');source('run_test.R')"
        
## Run with your data

Create a file similar to `run_test.R`, complete with the right parameters and repeat process.