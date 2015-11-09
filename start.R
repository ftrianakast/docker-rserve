#Install Rserve
install.packages('Rserve', repos='http://cran.r-project.org')

#Start Rserve
run.Rserve(debug = TRUE, 6311, args = NULL, config.file = "Rserv.conf")


# 
install.packages('devtools', dependencies=TRUE, repos='http://cran.r-project.org')
devtools::install_github('duncantl/RAmazonS3')
devtools::install_github("rstudio/rsconnect")
devtools::install_github("rstudio/shiny")
