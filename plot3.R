### Loading the data and subsetting
######################
Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
IndexByDate <- Data$Date == "1/2/2007" | Data$Date == "2/2/2007"
Data <- Data[IndexByDate, ]


### Changing dates and times format in order to get requested plot
####################################################################
Dates <- as.Date(Data$Date, format="%d/%m/%Y")
Times <- Data$Time
DatesTimes <- strptime(paste(Dates, Times), format="%Y-%m-%d %H:%M:%S")

### Making and saving plot 
######################
png("plot3.png", width=480, height=480, type="quartz")
plot(DatesTimes,Data$Sub_metering_1,xlab = "",ylab = "Energy sub metering", type = "l")
lines(DatesTimes, Data$Sub_metering_2, col = "Red")
lines(DatesTimes, Data$Sub_metering_3, col = "Blue")
legend("topright",col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd =1)
dev.off()