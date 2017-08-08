epc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
epc$DateTime = paste(epc$Date, epc$Time)
epc$DateTime = as.POSIXlt(epc$DateTime,format="%d/%m/%Y %H:%M:%S")
epc$Date = NULL
epc$Time = NULL

subepc <- subset(epc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("PNG/plot3.png")
plot(x=(subepc$DateTime),y=subepc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(subepc$DateTime),y=subepc$Sub_metering_2,col="red")
lines(x=(subepc$DateTime),y=subepc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
