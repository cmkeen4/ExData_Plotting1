hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
str(hpcData)
hpcData$Date <- as.Date(hpcData$Date, "%d/%m/%Y")

D1 <- as.Date("2007-02-01")
D2 <- as.Date("2007-02-02")

febData <- subset(hpcData, hpcData$Date %in% c(D1, D2))
str(febData)

sub1 <- as.numeric(febData$Sub_metering_1)
sub2 <- as.numeric(febData$Sub_metering_2)
sub3 <- as.numeric(febData$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480)
plot(sub1, type="l", xlab="", ylab="Energy Sub Metering", main=NULL, 
     xaxt="n", yaxt="n")
lines(sub2, type="l", col="red")
lines(sub3, type="l", col="blue")
axis(side=2, at=seq(0,30, 10), labels=seq(0,30, 10))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="___")

dev.off()
