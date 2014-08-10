plot2 <- function() {
     data <- read.table("household_power_consumption.txt",
                        sep = ";", col.names = c("Date", "Time", 
                        "GlobalActivePower", "GlobalReactivePower", 
                        "Voltage", "GlobalIntensity", "SubMetering1", 
                        "SubMetering2", "SubMetering3"), nrows = 2880, 
                        skip = 66637)
     data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
     data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
     
     png(file = "plot2.png")
     plot(data$Time, data$GlobalActivePower, type = "l", xlab = "", 
                         ylab = "Global Active Power (kilowatts)")
     dev.off()
}