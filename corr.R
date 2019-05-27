## Part 3 - correlation between sulfate/nitrate for monitor locations
  setwd("D:/Online Learning/Data Specialization/R Programming/specdata")
  specdata <- getwd()
            corr <- function(directory, threshold = 0) {
              directory <- list.files(directory, full.names= TRUE)
              dat <- vector(mode = "numeric", length = 0)
                for (i in 1:length(directory)) {
                tmp <- read.csv(directory[i], header = TRUE)
                tmp <-tmp[complete.cases(tmp),]
                numobs<-nrow(tmp)
                    if(numobs>threshold){
                    dat<- c(dat, cor(tmp$nitrate,tmp$sulfate))
                    }}
              return(dat)
              }
            
## Test for correlations
  cr <- corr(specdata, 150)
  head(cr)
  summary(cr)