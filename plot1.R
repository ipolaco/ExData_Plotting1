### Loading the data and subsetting
######################
Data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
IndexByDate <- Data$Date == "1/2/2007" | Data$Date == "2/2/2007"
Data <- Data[IndexByDate, ]

### Making and saving plot 
######################
png("plot1.png", width=480, height=480, type="quartz")
hist(Data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()