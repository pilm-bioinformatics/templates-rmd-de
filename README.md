# templates-rmd-de

Differential expression analysis template

[![Docker](https://img.shields.io/docker/automated/lpantano/templates-rmd-de.svg)](https://hub.docker.com/r/lpantano/templates-rmd-de/)

# Quick start

        
## Run with rmdCore

```r
install.packages("devtools")
devtools::install_github("pilm-bioinformatics/rmdCore")
library(rmdCore)
download.file("https://github.com/pilm-bioinformatics/templates-rmd-de/raw/master/data/se.rds", "se.rds")
run_template("pilm-bioinformatics/templates-rmd-de", 
             "working_dir",
             options = list(se_file = "se.rds",
                            output_dir = "test",
                            contrast = list(c("condition", "treated", "untreated"),
                                    c("type", "paired-end", "single-read"))),
              output_dir = "test",
              output_file = "de.html")
```

## Run with rmarkdown

Download the repository and get inside:

    cd pilm-bioiformatics/templates-rmd-de
  
### Run insde R:

    dir.create("test")
    rmarkdown::render("main.Rmd",
      params = list(se_file = "data/se.rds",
                    output_dir = "test",
                    contrast = list(c("condition", "treated", "untreated"),
                                    c("type", "paired-end", "single-read"))),
      output_dir = "test",
      output_file = "de.html")

Modify parameters to match your data.

### Run with docker

    docker run -v `pwd`:/mnt/analysis -ti --user bioc \
        pilm-bioinformatics/templates-rmd-de R 
 
 And use any of the previous commands.
