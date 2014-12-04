powerdata <- read.table("household_power_consumption.txt" ,header=TRUE, sep=";", na.strings="?")

power <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
day = as.POSIXct( paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S", axis=axis)
datetime=day

# plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,2))
with(power, {
  plot(day,Global_active_power,type="l",ylab="Global Active Power")
  plot(datetime,Voltage,type="l",ylab="Voltage")
  
  plot(day,Sub_metering_1,type="l",ylab="Energy sub metering")
  
  points(day,Sub_metering_2,type="l",col="red")
  points(day,Sub_metering_3,type="l",col="blue")
  legend("topright",col=c("black","red", "blue"), bty="n",cex=0.7,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , lwd=1)
  plot(datetime,Global_reactive_power,type="l",ylab="Global_reactive_power")
})

dev.off()