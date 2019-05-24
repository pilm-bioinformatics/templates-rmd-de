# templates-rmd-de

Differential expression analysis template

[![Docker](https://img.shields.io/docker/automated/lpantano/templates-rmd-de.svg)](https://hub.docker.com/r/lpantano/templates-rmd-de/)

[![example](https://img.shields.io/badge/report-example-green.svg)](https://pilm-bioinformatics.github.io/templates-rmd-de/de.html)

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
                            contrast = "condition.treated_vs_untreated, type.paired-end_vs_single-read",
              output_file = "test/de.html")
```

### Run with manually

Download the repository and get inside:

    cd pilm-bioiformatics/templates-rmd-de
  
### Run insde R:

    rmarkdown::render("main.Rmd",
      params = list(se_file = "data/se.rds",
                    output_dir = "test",
                    contrast = "condition.treated_vs_untreated, type.paired-end_vs_single-read",
      output_file = "test/de.html")

Modify parameters to match your data.

### Run with rmdCore
    
    devtools::install_github("pilm-bioinformatics/rmdCore")
    rmdCore::run_template(".", NULL, output_file = "docs/de.html")
    
If you want only to get a copy of a template run:
  
    rmdCore::run_template("pilm-bioiformatics/templates-rmd-de")

### Run with docker

    docker run -v `pwd`:/mnt/analysis -ti --user bioc \
        pilm-bioinformatics/templates-rmd-de R \
        rmdCore::run_template(".", NULL, output_file = "docs/de.html")
 
 And use any of the previous commands.
