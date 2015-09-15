# plot4.R

rawdata <- read.csv2("household_power_consumption.txt", colClasses = "character")
cleandata <- rawdata

# Filter on date range
cleandata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
cleandata <- cleandata[cleandata[,1] <= "2007-02-02" & cleandata[,1] >= "2007-02-01",]
cleandata$Time <- paste(cleandata$Date, cleandata$Time)
cleandata$Time <- strptime(cleandata$Time, "%Y-%m-%d %H:%M:%S")

# Fix data types the manual way
cleandata$Global_active_power <- as.numeric(cleandata$Global_active_power)
cleandata$Global_reactive_power <- as.numeric(cleandata$Global_reactive_power)
cleandata$Voltage <- as.numeric(cleandata$Voltage)
cleandata$Global_intensity <- as.numeric(cleandata$Global_intensity)
cleandata$Sub_metering_1 <- as.numeric(cleandata$Sub_metering_1)
cleandata$Sub_metering_2 <- as.numeric(cleandata$Sub_metering_2)
cleandata$Sub_metering_3 <- as.numeric(cleandata$Sub_metering_3)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# plot (1,1)
plot(cleandata$Time, cleandata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# plot (1,2)
plot(cleandata$Time, cleandata$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# plot (2,1)
plot(cleandata$Time, cleandata$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
points(cleandata$Time, cleandata$Sub_metering_2, type = "l",
       col = "red", xlab = "", ylab = "Energy sub metering")
points(cleandata$Time, cleandata$Sub_metering_3, type = "l",
       col = "blue", xlab = "", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), cex = 1, inset = 0.01, lty = c(1,1,1), box.lty = 0)

# plot (2,2)
plot(cleandata$Time, cleandata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

# Save plot as file ie copy to png file device
#dev.copy(png, file = "plot4.png")
dev.off()

