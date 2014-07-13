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

##Convert Data to Numeric for Plot 2
q <- as.numeric(as.character(PowerData2sub$Global_active_power))

##Plot 2 Requirements
png(filename="plot2.png", width=480, height=480, units="px")
plot(q,type="l", ylab="Global Active Power (kilowatts)", xlab="", axes=FALSE)
##Manual axis definition
axis(2,at=c(0,2,4,6), labels=c(0,2,4,6))
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
##Add a Box
box()
dev.off()