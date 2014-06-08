#  Plot3.R
# read the datafile and keep only data for feb1,2 2007
data <- read.table("household_power_consumption.txt",colClasses="character",header=T, sep = ";")
data <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert sub metering 1,2,3  to numeric
data[,"Sub_metering_1"] <- as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"] <- as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"] <- as.numeric(data[,"Sub_metering_3"])
# convert date and time into a date/time type and store in x
 x <- strptime(paste(data[,"Date"],data[,"Time"]),"%d/%m/%Y %H:%M:%S")
# create png file
png("plot3.png",width=480,height=480)
plot(x,data$Sub_metering_1,type="n",main="",xlab="",ylab="Energy sub metering")
lines(x,data$Sub_metering_1)
lines(x,data$Sub_metering_2,col="red")
lines(x,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()