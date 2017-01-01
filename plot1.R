#reading data
Data <- "./household_power_consumption.txt"
household_power_consumption <- read.table(Data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subsetting data
data<-household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007"),]

#plotting
globalActivePower <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 