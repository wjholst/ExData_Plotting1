
checkFileExists <- function () {

    # ensures that the download file exists and has been unzipped...    

    setwd("C:/Users/wj/Documents/R Programming/ExploratoryDataAnalysis")
    
    zipfile<- "zipfile.zip"
    
    if (!file.exists(zipfile)) {
        fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,destfile=zipfile)
    
        dateDownloaded<-date()
        dateDownloaded
    # 
    # Extract the downloaded zip file
    #
        unzip(zipfile)
    }
    zipfile
}



