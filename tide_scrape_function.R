library(XML)

tideurl = "http://tides.mobilegeographics.com/calendar/month/4082.html?y=2016&m=5&d=20"

tidetable = readHTMLTable(tideurl, header = TRUE, as.data.frame = TRUE)


tidetable = as.data.frame(tidetable$"NULL")

tidetable


scrapetide = function( year, month) {
  
  tideurl = paste("http://tides.mobilegeographics.com/calendar/month/4082.html?y=", year, "&m=", month, "&d=20")
  tidetable = readHTMLTable(tideurl, header = TRUE, as.data.frame = TRUE)
  tidetable = as.data.frame(tidetable$"NULL")
  return(tidetable)
  
  
}

scrapetide(2015, 4)

