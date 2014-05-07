hpcData <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
str(hpcData)
hpcData$Date <- as.Date(hpcData$Date, "%d/%m/%Y")

D1 <- as.Date("2007-02-01")
D2 <- as.Date("2007-02-02")

febData <- subset(hpcData, hpcData$Date %in% c(D1, D2))
str(febData)

gap <- as.numeric(febData$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480)
plot(gap, type="l", xlab="", ylab="Global Active Power(kilowatts)", main=NULL, 
     xaxt="n", yaxt="n")
axis(side=2, at=seq(0,3000, 1000), labels=seq(0,6, 2))
axis(side=1, at=seq(0,2880, 1440), labels=c("Thurs","Fri", "Sat"))

dev.off()

