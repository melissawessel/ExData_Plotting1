plot1 <- function() {
     data <- read.table("household_power_consumption.txt",
                        sep = ";", col.names = c("Date", "Time", 
                        "GlobalActivePower", "GlobalReactivePower", 
                        "Voltage", "GlobalIntensity", "SubMetering1", 
                        "SubMetering2", "SubMetering3"), nrows = 2880, 
                        skip = 66637)
     data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
     data$Time <- strptime(data$Time, format = "%H:%M:%S")
     
     png(file = "plot1.png")
     hist(data$GlobalActivePower, col = "red", main = "Global Reactive Power",
                         xlab = "Global Active Power (kilowatts)")
     dev.off()
}