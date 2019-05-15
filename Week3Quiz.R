## Week 3 Quiz

## Question 1

    library(readr)
    getdata_data_ss06hid <- read_csv("D:/Online Learning/Data Specialization/Cleaning Data/Week 3/getdata_data_ss06hid.csv")
    View(getdata_data_ss06hid)

  ## Create a logical vector that identifies the households on greater than 
  ## 10 acres who sold more than $10,000 worth of agriculture products. 
  ## Assign that logical vector to the variable agricultureLogical. 
  ## Apply the which() function like this to identify the rows of the data frame 
  ## where the logical vector is TRUE.
    acsdata <- getdata_data_ss06hid
    agricultureLogical = acsdata$ACR == 3 & acsdata$AGS ==6
    head(which(agricultureLogical), 3)

## Question 2
    
  ## Using the jpeg package read in the following picture of your instructor into R
  https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
  
  ## Use the parameter native=TRUE. What are the 30th and 80th quantiles of the 
  ## resulting data? (some Linux systems may produce an answer 638 different for 
  ## the 30th quantile)
  library(jpeg)
  fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
  dest = 'D:/Online Learning/Data Specialization/Cleaning Data/Week 3/q2image.jpg'
  download.file(fileurl, dest, mode = 'wb', method = 'curl')
  img_data = readJPEG(dest, native = TRUE)
  quantile(img_data, prob = c(0.3, 0.8))

## Question 3
  ## Load Data 
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
  
  library(readr)
  getdata_data_GDP <- read_csv("getdata_data_GDP.csv")
  View(getdata_data_GDP)
  
  library(readr)
  getdata_data_EDSTATS_Country <- read_csv("getdata_data_EDSTATS_Country.csv")
  View(getdata_data_EDSTATS_Country)
  
  ## Match the data based on the country shortcode. How many of the IDs match? 
  ## Sort the data frame in descending order by GDP rank (so United States is last). 
  ## What is the 13th country in the resulting data frame?
  library(readr)
  getdata_data_GDP <- read_csv("getdata_data_GDP.csv")
  View(getdata_data_GDP)
  
  getdata_data_EDSTATS_Country <- read_csv("getdata_data_EDSTATS_Country.csv")
  View(getdata_data_EDSTATS_Country)
  library(dplyr)
  library(data.table)

  gdp <- fread(file="getdata_data_GDP.csv", skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
  edu <- fread(file="getdata_data_EDSTATS_Country.csv")
  mergedData = merge(gdp, edu, by = "CountryCode")
  nrow(mergedData)
  arrange(mergedData, desc(Rank))[13, "Economy"]
  
## Question 4
  
  ## What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

  gdp <- fread(file="getdata_data_GDP.csv", skip = 5, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
  edu <- fread(file="getdata_data_EDSTATS_Country.csv", select = c(1, 3), col.names = c("CountryCode", "IncomeGroup"))
  mergedData = merge(gdp, edu, by = "CountryCode")
  tapply(mergedData$Rank, mergedData$IncomeGroup, mean)
  
## Question 5
  
  ## Cut the GDP ranking into 5 separate quantile groups. 
  ## Make a table versus Income.Group. How many countries.
  library(Hmisc)
  mergedData$quant= cut2(mergedData$Rank, g=5)
  table(mergedData$quant, mergedData$IncomeGroup)

