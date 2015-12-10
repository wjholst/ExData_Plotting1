setwd("~/R Programming/ExploratoryDataAnalysis")

# Read the data if not already present
source('~/R Programming/ExploratoryDataAnalysis/checkFileExists.R')
checkFileExists()

# Extract subset for 2007-2-1 and 2007-2-2; nb date is in dd/mm/yyyy format

pData=read.table("household_power_consumption.txt",na.strings="?",nrows=-1,header=TRUE,sep=";",stringsAsFactor=FALSE)
powerData=pData[pData$Date %in% c("1/2/2007","2/2/2007"),]
dim(powerData) # should be 2880x9

#plot3
par(mfrow=c(1,1),mar=c(4,4,2,2),oma=c(0,0,2,0))
datetime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, powerData$Sub_metering_1, type="l", ylab="Energy Submetering (watt-hour)", xlab="")
lines(datetime, powerData$Sub_metering_2, type="l", ylab="Energy Submetering", xlab="",col="Red")
lines(datetime, powerData$Sub_metering_3, type="l", ylab="Energy Submetering", xlab="",col="Blue")
legend("top", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=1,bty = "n")
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

