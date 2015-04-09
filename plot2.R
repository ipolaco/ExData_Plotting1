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
png("plot2.png", width=480, height=480, type="quartz")
plot(DatesTimes,Data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()