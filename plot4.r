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

##Convert Data to Numeric for Plot 4
q <- as.numeric(as.character(PowerData2sub$Global_active_power))
sub1 <- as.numeric(as.character(PowerData2sub$Sub_metering_1))
sub2 <- as.numeric(as.character(PowerData2sub$Sub_metering_2))
sub3 <- as.numeric(as.character(PowerData2sub$Sub_metering_3))
volt <- as.numeric(as.character(PowerData2sub$Voltage))
reactive <- as.numeric(as.character(PowerData2sub$Global_reactive_power))

#####Plot 4 Requirements
png(filename="plot4.png", width=480, height=480, units="px")

####Establish framework for 2 row and 2col presentation
par(mfrow=c(2,2))

###Global Active Power
plot(q,type="l", ylab="Global Active Power (kilowatts)", xlab="", axes=FALSE)
##Manual axis definition
axis(2,at=c(0,2,4,6), labels=c(0,2,4,6))
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
##Add a Box
box()

###Voltage
plot(volt,type="l", ylab="Voltage", xlab="", axes=FALSE)
##Manual axis definition
axis(2,at=c(234,236,238,240,242,244,246), labels=c(234,236,238,240,242,244,246))
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
##Add a Box
box()

###Energy sub metering
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

###Global_reactive_power
plot(reactive,type="l", ylab="Global_reactive_power", xlab="", axes=FALSE)
##Manual axis definition
axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
##Add a Box
box()

dev.off()