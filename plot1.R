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


