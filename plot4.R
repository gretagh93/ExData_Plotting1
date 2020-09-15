#Read file
data<-read.table("power.txt", header=TRUE, sep=";")
data2<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
t<-strptime(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
#Plot 2
plot(x=t, y=data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Plot 3
plot(x=t, y=as.numeric(data2$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering")
lines(x=t, y=as.numeric(data2$Sub_metering_2), col="red")
lines(x=t, y=as.numeric(data2$Sub_metering_3), col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Voltage plot 
plot(x=t, y=as.numeric(data2$Voltage), type="l", xlab="datetime", ylab="Voltage")
#Global reactive power plot 
plot(x=t, y=as.numeric(data2$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
#
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()