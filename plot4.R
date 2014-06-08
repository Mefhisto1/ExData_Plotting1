
plot4 <- function() {
library(data.table)
newFile <- fread("household_power_consumption.txt", na.strings = "?")

newFile[,DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
library(dplyr)
subsetted <- filter(newFile, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime < as.POSIXct("2007-02-03 00:00:00"))

png(filename="plot4.png")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(subsetted, {
  plot(subsetted$DateTime, subsetted$Global_active_power,col="black", type="l",data=subsetted, ylab="Global active power", xlab="")
  plot(subsetted$DateTime, subsetted$Voltage,col="black", type="l",data=subsetted, ylab="Voltage", xlab="datetime")
  
  plot(subsetted$DateTime, subsetted$Sub_metering_1,col="black", type="l",data=subsetted, ylab="Energy sub metering", xlab="")
  
  lines(subsetted$DateTime, subsetted$Sub_metering_2, col="red")
  lines(subsetted$DateTime, subsetted$Sub_metering_3, col="blue")
  legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1), 
         lwd=c(2.5,2.5, 2.5), col=c("black","red","blue"))
  
  plot(subsetted$DateTime, subsetted$Global_reactive_power,col="black", type="l",data=subsetted, ylab="Global_reactive_power", xlab="datetime")
  
  
})

dev.off()


}
