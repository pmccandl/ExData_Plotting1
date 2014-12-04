powerdata <- read.table("household_power_consumption.txt" ,header=TRUE, sep=";", na.strings="?")

power <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
day = as.POSIXct( paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")


# plot 3
png(filename="plot3.png", width=480, height=480)
par(mar=c(4,4,2,1))
plot(day,power$Sub_metering_1,type="l",ylab="Energy sub metering")

points(day,power$Sub_metering_2,type="l",col="red")
points(day,power$Sub_metering_3,type="l",col="blue")


legend("topright",col=c("black","red", "blue"),cex=0.8, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lwd=1)

dev.off()