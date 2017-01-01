#reading data
Data <- "./household_power_consumption.txt"
household_power_consumption <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting data
data<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),] 

#converting to calendar dates and times
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

#saving variables as numeric
Submetering1<-as.numeric(data$Sub_metering_1)
Submetering2<-as.numeric(data$Sub_metering_2)
Submetering3<-as.numeric(data$Sub_metering_3)
globalActivePower <- as.numeric(data$Global_active_power)
voltage<-as.numeric(data$Voltage)
globalReactivePower <- as.numeric(data$Global_reactive_power)

#PLOTTING
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#first plot
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
#second plot
plot(DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
#third plot
plot(DateTime,Submetering1, type="l",col="black",xlab="", ylab="Energy sub metering")
lines(DateTime,Submetering2, type="l",col="red")
lines(DateTime,Submetering3, type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"),bty="n")
#fourth plot
plot(DateTime, globalReactivePower, type="l", xlab="", ylab="Global_reactive_power")
dev.off()