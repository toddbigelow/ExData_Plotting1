library(lubridate)

#plots line chart of active power over a 2 day period 
create_plot2 <- function()
{
  pdt <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",  sep = ';', header = TRUE)
  
  #clean dates
  ddt <- dmy(pdt[,1])
  sdt <- pdt[ddt == dmy("01-02-2007") | ddt == dmy("02-02-2007"), ]
  mydate <- dmy(sdt$Date) + hms(sdt$Time)
  
  #open graphics file and plto data
  png(file = "plot2.png", width = 480, height = 480, units = "px", type = "cairo-png")
  plot(mydate, as.numeric(as.character(sdt$Global_active_power)), type="l",  xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}

