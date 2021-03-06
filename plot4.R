plot4 <- function() {
     data <- read.table("household_power_consumption.txt",
                        sep = ";", col.names = c("Date", "Time", 
                                                 "GlobalActivePower", "GlobalReactivePower", 
                                                 "Voltage", "GlobalIntensity", "Sub_metering_1", 
                                                 "Sub_metering_2", "Sub_metering_3"), nrows = 2880, 
                        skip = 66637)
     data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
     data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
     
     png(file = "plot4.png")
     par(mfrow = c(2, 2))
     plot(data$Time, data$GlobalActivePower, type = "l", xlab = "", 
          ylab = "Global Active Power")
     plot(data$Time, data$Voltage, type = "l", xlab = "datetime", 
          ylab = "Voltage")
     plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
     lines(data$Time, data$Sub_metering_2, type = "l", col = "red")
     lines(data$Time, data$Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
            legend = colnames(data)[7:9])
     plot(data$Time, data$GlobalReactivePower, type = "l", xlab = "datetime", 
          ylab = "Global_reactive_power")
     dev.off()
}