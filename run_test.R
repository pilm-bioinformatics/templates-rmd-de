rmarkdown::render("main.Rmd",
      params = list(se_file = "data/se.rds",
                    output_dir = "test",
                    contrast = list(c("condition", "treated", "untreated"),
                                    c("type", "paired-end", "single-read"))),
      output_dir = "test",
      output_file = "de.html")
