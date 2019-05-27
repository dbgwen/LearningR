## Deborah Passey, R Programming - Coursera

## Part 1 - Pollutant mean
  setwd("D:/Online Learning/Data Specialization/R Programming/specdata")
  specdata <- getwd()

  pollutantmean <- function(directory, pollutant, id=1:332) {
         directory <- list.files(directory, full.names= TRUE)
         dat <- data.frame()
                 for (i in id) {
                 tmp <- read.csv(directory[i])
                 dat <- rbind(dat,tmp) 
                 }
          mean(dat[,pollutant], na.rm = TRUE)
          }

## test of pollutantmean
  pollutantmean(specdata, "sulfate", 1:10)
  pollutantmean(specdata, "nitrate", 70:72)
  pollutantmean(specdata, "nitrate", 23)


