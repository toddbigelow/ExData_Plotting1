library(lubridate)

#plots line chart of sub metering over a 2 day period 
create_plot3 <- function()
{
  pdt <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",  sep = ';', header = TRUE)
  
  #clean dates
  ddt <- dmy(pdt[,1])
  sdt <- pdt[ddt == dmy("01-02-2007") | ddt == dmy("02-02-2007"), ]
  mydate <- dmy(sdt$Date) + hms(sdt$Time)
  
  #open graphics file and plto data
  png(file = "plot3.png", width = 480, height = 480, units = "px", type = "cairo-png")
  plot(mydate, as.numeric(as.character(sdt$Sub_metering_1)), type="l",  xlab = "", ylab = "Energy sub metering")
  lines(mydate, as.numeric(as.character(sdt$Sub_metering_2)), col = "red")
  lines(mydate, as.numeric(as.character(sdt$Sub_metering_3)), col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}

