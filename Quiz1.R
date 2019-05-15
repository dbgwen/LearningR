## Quiz 1 ##

## CSV
getdata_data_ss06hid <- read.csv("D:/Online Learning/Data Specialization/Cleaning Data/Week 1/getdata_data_ss06hid.csv")
housedata <-data.frame(getdata_data_ss06hid)
q1 <- subset(housedata, VAL >= 24)
summary(q1$VAL)

## XLSX
setwd("D:/Online Learning/Data Specialization/Cleaning Data/Week 1")
library(openxlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", sheet = 1, rows = 18:23, cols = 7:15)
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231])

## XML
library(XML)
fileUrl <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <-xmlRoot(doc)
zipcode<- xpathSApply(doc,"//zip[@class='21231']", xmlValue)

