setwd("/Users/gilrosst/Documents/Data Science/R Working Directory/expcourproj1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

date1 <- as.Date("2007-02-01")

date2 <- as.Date("2007-02-02")

data1 <- data[data$Date >= date1 & data$Date <= date2, ]

data1$Sub_metering_1 <- as.numeric(data1$Sub_metering_1)

data1$Sub_metering_2 <- as.numeric(data1$Sub_metering_2)

data1$Sub_metering_3 <- as.numeric(data1$Sub_metering_3)

data1$DateTime <- strptime(paste(as.character(data1$Date), data1$Time), format = "%Y-%m-%d %H:%M:%S")

plot(data1$DateTime, data1$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = "")
lines(data1$DateTime, data1$Sub_metering_2, type = "l", col = "red")
lines(data1$DateTime, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.copy(png, file = "plot3.png")
dev.off()