powerdata <- read.table("household_power_consumption.txt" ,header=TRUE, sep=";", na.strings="?")

power <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
day = as.POSIXct( paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")


# plot 2
png(filename="plot2.png", width=480, height=480)
plot(day,power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")

dev.off()