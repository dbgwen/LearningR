## Week 4 - Swirl
## "lubridate has a consistent, memorable syntax, that makes working
## with dates fun instead of frustrating." If you've ever worked with dates in R, that statement probably
## has your attention."

## Using Lubridate
  
  ## Creating and extracting dates and times

  today() ##returns today's date
  year()
  month()
  day()
  hour()
  minute()
  second()
  wday() ## returns day of the week as 1 = Sunday, 2 = Monday, 3 = Tuesday, etc
  wday(this_day, label = TRUE) ##represented as ordered factor
  now() ##returns date and time for that exact time (e.g. timestamp)
  now("America/New_York") ##returns date and time for that timezone
      http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  
  ## Parsing dates and times from wild data
  ymd() ##takes string character as input and returned POSIXCT class 
  dmy()
  hms()
  ymd_hms()
  update() ##update components of date-time
  nyc + days(2) ##adds two days to the date stored in variable nyc
  depart + hours(15) + minutes(50) ##adds hours and minutes
  with_tz(arrive, tzone ="Asia/Hong_Kong") ##change timezone
  
  instants
  intervals
  durations
  periods
  
  
