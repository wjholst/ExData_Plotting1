setwd("~/R Programming/ExploratoryDataAnalysis")

# Read the data if not already present
source('~/R Programming/ExploratoryDataAnalysis/checkFileExists.R')
checkFileExists()

# Extract subset for 2007-2-1 and 2007-2-2; nb date is in dd/mm/yyyy format

pData=read.table("household_power_consumption.txt",na.strings="?",nrows=-1,header=TRUE,sep=";",stringsAsFactor=FALSE)
powerData=pData[pData$Date %in% c("1/2/2007","2/2/2007"),]
dim(powerData) # should be 2880x9


# Plot1
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0))
hist(powerData$Global_active_power,main ="Plot 1 - Global Active Power",xlab="Global Active Power (kW)",col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

# plot2
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0))
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot (datetime,powerData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kW)",main="Plot 2")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#plot3
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0))
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, powerData$Sub_metering_1, type="l", ylab="Energy Submetering (watt-hour)", xlab="")
lines(datetime, powerData$Sub_metering_2, type="l", ylab="Energy Submetering", xlab="",col="Red")
lines(datetime, powerData$Sub_metering_3, type="l", ylab="Energy Submetering", xlab="",col="Blue")
legend("top", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1,bty = "n")
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#plot4
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with (powerData, {
    plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kW)",main="Plot 1")

    plot(datetime,Voltage,type="l",xlab="",ylab="Voltage",main="Plot 2")
    
    plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering (watt-hour)", xlab="",main="Plot 3")
    lines(datetime, Sub_metering_2, type="l", xlab="",col="Red")
    lines(datetime, Sub_metering_3, type="l", xlab="",col="Blue")
    legend("top", col=c("black", "red", "blue"), lty=1, lwd=2, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1,bty = "n")
    
    plot(datetime,Global_reactive_power,type="l",xlab="",ylab="Global Reactive Power (kW)",main="Plot 4")
    mtext("Single Home Power/Energy Usage - 2/1/2007-2/2/2007",outer=T)
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()
})


