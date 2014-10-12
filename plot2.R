data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

date1 <- as.Date("2007-02-01")

date2 <- as.Date("2007-02-02")

data1 <- data[data$Date >= date1 & data$Date <= date2, ]

data1$Global_active_power <- as.numeric(data1$Global_active_power)

data1$DateTime <- strptime(paste(as.character(data1$Date), data1$Time), format = "%Y-%m-%d %H:%M:%S")

plot(data1$DateTime, data1$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()