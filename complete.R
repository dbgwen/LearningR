## Part 2 - complete cases
  setwd("D:/Online Learning/Data Specialization/R Programming/specdata")
  specdata <- getwd()
       complete <- function(directory, id = 1:332) {
          directory <- list.files(directory, full.names= TRUE)
          dat <- data.frame()
                for (i in id) {
                tmp <- read.csv(directory[i], header = TRUE)
                tmp <-na.omit(tmp)
                nobs<-nrow(tmp)
                dat <- rbind(dat,data.frame(i, nobs))
                }
            return(dat)
          }

## Test of complete
  complete(specdata, 1)
  complete(specdata, c(2, 4, 8, 10, 12))
  complete(specdata, 30:25)
  complete(specdata, 3)
