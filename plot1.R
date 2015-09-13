# plot1.R

rawdata <- read.csv2("household_power_consumption.txt", colClasses = "character")
cleandata <- rawdata

# Filter on date range
cleandata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
cleandata <- cleandata[cleandata[,1] <= "2007-02-02" & cleandata[,1] >= "2007-02-01",]
cleandata$Time <- paste(cleandata$Date, cleandata$Time)
cleandata$Time <- strptime(cleandata$Time, "%Y-%m-%d %H:%M:%S")

# Fix data types the manual way (Time is unchanged)
cleandata$Global_active_power <- as.numeric(cleandata$Global_active_power)
cleandata$Global_reactive_power <- as.numeric(cleandata$Global_reactive_power)
cleandata$Voltage <- as.numeric(cleandata$Voltage)
cleandata$Global_intensity <- as.numeric(cleandata$Global_intensity)
cleandata$Sub_metering_1 <- as.numeric(cleandata$Sub_metering_1)
cleandata$Sub_metering_2 <- as.numeric(cleandata$Sub_metering_2)
cleandata$Sub_metering_3 <- as.numeric(cleandata$Sub_metering_3)

hist(cleandata$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()
