#reading data
Data <- "./household_power_consumption.txt"
household_power_consumption <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting data
data<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),] 

#converting to calendar dates and times
DateTime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

#plotting
globalActivePower <- as.numeric(data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 