hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
str(hpcData)
hpcData$Date <- as.Date(hpcData$Date, "%d/%m/%Y")

D1 <- as.Date("2007-02-01")
D2 <- as.Date("2007-02-02")

febData <- subset(hpcData, hpcData$Date %in% c(D1, D2))
str(febData)

gap <- as.numeric(febData$Global_active_power)
sub1 <- as.numeric(febData$Sub_metering_1)
sub2 <- as.numeric(febData$Sub_metering_2)
sub3 <- as.numeric(febData$Sub_metering_3)
volt <- as.numeric(febData$Voltage)
grp <- as.numeric(febData$Global_reactive_power)

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2)) ## creates four plots two by two square 
## c(2,2) means 2 columns with 2 rows, fills top to bottom, left to right
par(mar=c(5,5,1,1)) ## change the margins to 5 on bottom and left, 1 top and right
## first plot - Global Active Power (1,1) first row, first column
plot(gap, type="l", xlab="", ylab="Global Active Power", main=NULL, 
     xaxt="n", yaxt="n")
axis(side=2, at=seq(0,3000, 1000), labels=seq(0,6, 2))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))

## second plot - Energy Sub Metering (2,1) second row, first column
plot(sub1, type="l", xlab="", ylab="Energy Sub Metering", main=NULL, 
     xaxt="n", yaxt="n")
lines(sub2, type="l", col="red")
lines(sub3, type="l", col="blue")
axis(side=2, at=seq(0,30, 10), labels=seq(0,30, 10))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="___")

## third plot - Voltage (1,2) first row, second column
plot(volt, type="l", xlab="datetime", ylab="Voltage", main=NULL, xaxt="n", yaxt="n")
axis(side=2, at=seq(800,2000, 200), labels=seq(234,246, 2))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))

## fourth plot - Global_reactive_power (2,2) second row, second column
plot(grp, type="l", xlab="datetime", ylab="Global_reactive_power", main=NULL, 
     xaxt="n", yaxt="n")
axis(side=2, at=seq(0,250, 50), labels=seq(0.0,0.5, 0.1))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))


dev.off()
