#reading data
Data <- "./household_power_consumption.txt"
household_power_consumption <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting data
data<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),] 

#converting to calendar dates and times
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

Submetering1<-as.numeric(data$Sub_metering_1)
Submetering2<-as.numeric(data$Sub_metering_2)
Submetering3<-as.numeric(data$Sub_metering_3)

#plotting
png("plot3.png", width=480, height=480)
plot(DateTime,Submetering1, type="l",col="black",xlab="", ylab="Energy sub metering")
lines(DateTime,Submetering2, type="l",col="red")
lines(DateTime,Submetering3, type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()