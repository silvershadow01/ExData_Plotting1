#  Plot4.R
# read the datafile and keep only data for feb1,2 2007
data <- read.table("household_power_consumption.txt",colClasses="character",header=T, sep = ";")
data <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert to numeric
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
data[,"Sub_metering_1"] <- as.numeric(data[,"Sub_metering_1"])
data[,"Sub_metering_2"] <- as.numeric(data[,"Sub_metering_2"])
data[,"Sub_metering_3"] <- as.numeric(data[,"Sub_metering_3"])
data[,"Global_reactive_power"] <- as.numeric(data[,"Global_reactive_power"])
data[,"Voltage"] <- as.numeric(data[,"Voltage"])

# convert date and time into a date/time type and store in x
 x <- strptime(paste(data[,"Date"],data[,"Time"]),"%d/%m/%Y %H:%M:%S")
# create png file
png("plot4.png",width=480,height=480)
# set 4 plots to a page columwise
par(mfcol=c(2,2))
# first plot
plot(x,data$Global_active_power,type="l",main="",
xlab="",ylab="Global Active Power")
# second plot
plot(x,data$Sub_metering_1,type="n",main="",xlab="",ylab="Energy sub metering")
lines(x,data$Sub_metering_1)
lines(x,data$Sub_metering_2,col="red")
lines(x,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n")
#third plot
plot(x,data$Voltage,type="l",main="",
xlab="datetime",ylab="Voltage")
#fourth plot
plot(x,data$Global_reactive_power,type="l",main="",
xlab="datetime",ylab="Global_reactive_power",lwd=0.1)
dev.off()