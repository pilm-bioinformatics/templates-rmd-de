FROM bioconductor/release_core2
LABEL authors="lorena.pantano@gmail.com" \
      description="Docker image containing all requirements for the pilm-bioinformatics/templates-rmd-de analysis"

COPY config/install.R /tmp/install.R
RUN R -f /tmp/install.R