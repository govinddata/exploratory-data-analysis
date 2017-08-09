## Getting full dataset
igdata <- read.csv("./exploratory-data-analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
igdata$Date <- as.Date(igdata$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(igdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(igdata)

## Converting dates
data_ig <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(data_ig)

## Plot 1
hist(subdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="./exploratory-data-analysis/Course_Project_1/figure/plot1.png", height=480, width=480)
dev.off()

