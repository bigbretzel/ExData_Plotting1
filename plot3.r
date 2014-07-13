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

##Convert Data to Numeric for Plot 3
q <- as.numeric(as.character(PowerData2sub$Global_active_power))
sub1 <- as.numeric(as.character(PowerData2sub$Sub_metering_1))
sub2 <- as.numeric(as.character(PowerData2sub$Sub_metering_2))
sub3 <- as.numeric(as.character(PowerData2sub$Sub_metering_3))

##Plot 3 Requirements
png(filename="plot3.png", width=480, height=480, units="px")
plot(sub1,type="l",ylab="Energy sub metering",xlab="",axes=FALSE)
lines(sub2,col="red")
lines(sub3,col="blue")

##Manual axis definition
axis(2,at=c(0,10,20,30), labels=c(0,10,20,30))
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
##Add a Box
box()
##Add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),border="black", lty=c(1,1,1), col=c("black", "red","blue"))

dev.off()