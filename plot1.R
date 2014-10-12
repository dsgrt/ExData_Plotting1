data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = "character")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

date1 <- as.Date("2007-02-01")

date2 <- as.Date("2007-02-02")

data1 <- data[data$Date >= date1 & data$Date <= date2, ]

data1$Global_active_power <- as.numeric(data1$Global_active_power)

hist(data1$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file = "plot1.png")
dev.off()