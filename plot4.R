library(lubridate)

#plots multiple line charts over a 2 day period 
create_plot4 <- function()
{
  pdt <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt",  sep = ';', header = TRUE)
  
  #clean dates
  ddt <- dmy(pdt[,1])
  sdt <- pdt[ddt == dmy("01-02-2007") | ddt == dmy("02-02-2007"), ]
  mydate <- dmy(sdt$Date) + hms(sdt$Time)
  
  #open graphics file and plto data
  png(file = "plot4.png", width = 480, height = 480, units = "px", type = "cairo-png")
  par(mfrow = c(2,2))
  plot(mydate, as.numeric(as.character(sdt$Global_active_power)), type="l",  xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(mydate, as.numeric(as.character(sdt$Voltage)), type = "l", xlab = "datetime", ylab = "Voltage")
  plot(mydate, as.numeric(as.character(sdt$Sub_metering_1)), type="l",  xlab = "", ylab = "Energy sub metering")
  lines(mydate, as.numeric(as.character(sdt$Sub_metering_2)), col = "red")
  lines(mydate, as.numeric(as.character(sdt$Sub_metering_3)), col = "blue")
  legend("topright", lty = 1, bty = "n",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(mydate, as.numeric(as.character(sdt$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}

