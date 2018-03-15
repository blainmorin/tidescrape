
###Load required packages
library(XML)
library(tidyverse)


###This function scrapes the tide data and saves it as a data frame
scrapetide = function( year, month) {
  
  tideurl = paste("http://tides.mobilegeographics.com/calendar/month/4082.html?y=", year, "&m=", month, "&d=20", sep = "")
  tidetable = readHTMLTable(tideurl, header = TRUE, as.data.frame = TRUE)
  tidetable = as.data.frame(tidetable$"NULL")
  return(tidetable)
  Sys.sleep(2 + rnorm(1, 1))
  
}


###Set years and months here

years = 2005:2015
months = 5:8

result = data.frame()

###This loops through the years and months specified above
for (i in (1:length(years))){
  for (j in (1:length(months))){
    
    temp = scrapetide(years[i], months[j])
    temp$year = years[i]
    temp$month = months[j]
    result = rbind(result, temp)

  }
}

write.csv(result, file = "newtide.csv")



