## Week 4 Quiz

## Question 1 
## Apply strsplit() to split all the names of the data frame on the 
## characters "wgtp". What is the value of the 123 element of the resulting list?

  library(readr)
  getdata_data_ss06hid <- read_csv("getdata_data_ss06hid.csv")
  View(getdata_data_ss06hid)
  acsdata <- getdata_data_ss06hid
  q1_split <- strsplit(names(acsdata), "wgtp")
  q1_split[[123]] 

## Question 2
## Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?
  
  library(data.table)
  gdp_dataset <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
              , skip=5
              , nrows=190
              , select = c(1, 2, 4, 5)
              , col.names=c("CountryCode", "Rank", "Country", "GDP") )
  GDP_fixed <- as.integer(gsub(pattern = ',', replacement = '', gdp_dataset$GDP))
  mean(GDP_fixed, na.rm = T)

## Question 3
## In the data set from Question 2 what is a regular expression that would allow you to 
## count the number of countries whose name begins with "United"? Assume that the variable 
## with the country names in it is named countryNames. How many countries begin with United?
  
  gdp_dataset$Country[grep("^United", gdp_dataset$Country)]
  gdp_dataset$Country[grep("*United", gdp_dataset$Country)]
  
## Question 4
## Match the data based on the country shortcode. Of the countries for which the end of the 
## fiscal year is available, how many end in June?
  
  library(data.table)
  gdp <- fread(file="getdata_data_GDP.csv", skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
  edu <- fread(file="getdata_data_EDSTATS_Country.csv")
  mergedData = merge(gdp, edu, by = "CountryCode")
  
  June_Fiscal <- grep("Fiscal year end: June", mergedData$`Special Notes`)
  NROW(June_Fiscal)
  
## Question 5
## How many values were collected in 2012? How many values were collected on Mondays in 2012?
  
  install.packages("quantmod")
  library(quantmod)
  library(lubridate)
  amzn = getSymbols("AMZN", auto.assign=FALSE)
  sampleTimes = index(amzn)
  amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
  NROW(amzn2012)
  NROW(amzn2012[weekdays(amzn2012) == "Monday"])
 
  
  
  
  
  