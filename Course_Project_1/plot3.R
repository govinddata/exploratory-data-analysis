## Getting full dataset
ig <- read.csv("./exploratory-data-analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
ig$Date <- as.Date(ig$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(ig, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ig)

## Converting dates
igdata <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(igdata)

## Plot 3
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="./exploratory-data-analysis/Course_Project_1/figure/plot3.png", height=480, width=480)
dev.off()
