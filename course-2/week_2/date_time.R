# Week 2: Dates and Times
x <- as.Date("1970-01-01")
x
x <- Sys.time() # POSIXct is the default class
x
class(x)
p <- as.POSIXlt(x) 
names(unclass(p)) # POSIXlt has far more metadata than POSIXct
p$sec
x<- strptime(c("January 10, 2020 10:30"), "%B %d, %Y %H:%M") #strptime has numerous arguments you can refer to
x
as.Date("2020-03-01") - as.Date("2020-02-28") # Date subtraction
