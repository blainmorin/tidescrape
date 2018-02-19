library(XML)
library(tidyverse)

scrapetide = function( year, month) {
  
  tideurl = paste("http://tides.mobilegeographics.com/calendar/month/4082.html?y=", year, "&m=", month, "&d=20", sep = "")
  tidetable = readHTMLTable(tideurl, header = TRUE, as.data.frame = TRUE)
  tidetable = as.data.frame(tidetable$"NULL")
  return(tidetable)
  Sys.sleep(6+runif(1)*20)
  
  
}

###Set years and months here

years = 2014:2016
months = 1:12

tester = data.frame()

for (i in (1:length(years))){
  for (j in (1:length(months))){
    temp = scrapetide(years[i], months[j])
    temp$year = years[i]
    temp$month = months[j]
    tester = rbind(tester, temp)
  }
  
}



