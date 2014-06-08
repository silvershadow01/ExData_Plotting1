#  Plot2.R
# read the datafile and keep only data for feb1,2 2007
data <- read.table("household_power_consumption.txt",colClasses="character",header=T, sep = ";")
data <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert Global active power to numeric
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
# convert date and time into a date/time type and store in x
 x <- strptime(paste(data[,"Date"],data[,"Time"]),"%d/%m/%Y %H:%M:%S")
# create png file
png("plot2.png",width=480,height=480)
plot(x,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()