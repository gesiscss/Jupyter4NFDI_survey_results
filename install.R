# install packages
install.packages(c("xlsx",
                   "ggplot2",
                   "finalfit",
                   "leaflet",
                   "tidygeocoder",
                   "tidyr",
                   "httr",
                   "xml2",
                   "qdapRegex",
                   "knitr",
                   "htmltools",
                   "dotenv",
                   "IRkernel"))

# register kernel
IRkernel::installspec(user = FALSE)
