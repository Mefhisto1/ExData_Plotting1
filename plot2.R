
plot2 <- function() {
  library(data.table)
  newFile <- fread("household_power_consumption.txt", na.strings = "?")
  
  newFile[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
  library(dplyr)
  subsetted <- filter(newFile, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
  png(filename="plot2.png")
  
  with(subsetted, plot(subsetted$DateTime, subsetted$Global_active_power, type='l', ylab="Global active power (kilowatts)", xlab=""))
  
  dev.off()
}