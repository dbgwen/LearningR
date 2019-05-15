## Quiz 2 - Week 2

## Question 1 - Register APP with GitHub API
    library(httr)
    
    # 1. Find OAuth settings for github:
    #    http://developer.github.com/v3/oauth/
    
    oauth_endpoints("github")
    
    # 2. To make your own application, register at
    #    https://github.com/settings/developers. Use any URL for the homepage URL
    #    (http://github.com is fine) and  http://localhost:1410 as the callback url
    #
    #    Replace your key and secret below.
    
    myapp <- oauth_app("github",
                       key = "eb7dbd454941145ad8ec",
                       secret = "f23574123bfca9e3fc8b762b4edea12b2f6dfa8e"
    )
    
    # 3. Get OAuth credentials
    github_token <- oauth1.0_token(oauth_endpoints("github"), myapp)
    
    # 4. Use API
    gtoken <- config(token = github_token)
    req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
    stop_for_status(req)
    output<- content(req)
    
    
    ## When was datasharing repo created
    datashare <- which(sapply(output, FUN=function(X) "datasharing" %in% X))
    datashare
    
    list(output[[16]]$name, output[[16]]$created_at)

## Question 2 - Use sqldf package to look at ACS Data
    library(readr)
    acs <- read_csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
    library(RSQLite)
    
    ## Which of the following commands will select only the data for 
    ##the probability weights pwgtp1 with ages less than 50?
    
    qldf("select * from acs where AGEP < 50 and pwgtp1")
    
## Question 3 - Use same data as Question 2, to find wha tis equivalent to unique(acs$AGEP)
    sqldf("select distinct AGEP from acs")
    
## Question 4 - How many unique characters on line from this website: http://biostat.jhsph.edu/~jleek/contact.html
    con = url("http://biostat.jhsph.edu/~jleek/contact.html")
    htmlCode = readLines(con)
    close(con)
    head(htmlCode)
    c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))
    
## Question 5 - Read in a fixed width format file (read.fwf)
    fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
    SST <- read.fwf(fileUrl, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
    head(SST)
    sum(SST[,4])
    
    
    
    
    
    