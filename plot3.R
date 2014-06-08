plot3 <- function() {
  library(data.table)
  newFile <- fread("household_power_consumption.txt", na.strings = "?")
  
  newFile[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
  library(dplyr)
  subsetted <- filter(newFile, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))
  
  png(filename="plot3.png")
  
  
  plot(subsetted$DateTime, subsetted$Sub_metering_1,col="black", type="l",data=subsetted, ylab="Energy sub metering", xlab="")
  
  lines(subsetted$DateTime, subsetted$Sub_metering_2, col="red")
  lines(subsetted$DateTime, subsetted$Sub_metering_3, col="blue")
  
  
  legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1), 
         lwd=c(2.5,2.5, 2.5), col=c("black","red","blue"))
  
  
  dev.off()
  
}