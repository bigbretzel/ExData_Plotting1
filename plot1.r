##Load data
##Assumes data file is located in working directory
PowerData2 = read.csv("household_power_consumption.txt", header=TRUE, sep=";")

##Convert dates to date format
PowerData2$Date <- as.Date(PowerData2$Date, "%d/%m/%Y")

##Convert times to time format
PowerData2$Time <- strptime(PowerData2$Time,format="%H:%M:%S")

##Set start and end dates
StartDate <- as.Date("2007-02-01")
EndDate <- as.Date("2007-02-02")

##Subset data by relevant dates
PowerData2sub <- subset(PowerData2, StartDate == PowerData2$Date | EndDate == PowerData2$Date)

##Convert Data to Numeric for Plot 1
q <- as.numeric(as.character(PowerData2sub$Global_active_power))

##Plot 1 Requirements
png(filename="plot1.png", width=480, height=480, units="px")
hist(q,col="red", freq=TRUE, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()