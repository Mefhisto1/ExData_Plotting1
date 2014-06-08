
plot1 <- function() {

data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")

data$Date <- as.Date(data$Date , "%d/%m/%Y")


dataToUse <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")


png(filename="plot1.png")

with(dataToUse, hist(dataToUse$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power'))

dev.off()

}
