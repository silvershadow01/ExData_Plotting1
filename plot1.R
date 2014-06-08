#  Plot1.R
# read the datafile and keep only data for feb1,2 2007
data <- read.table("household_power_consumption.txt",colClasses="character",header=T, sep = ";")
data <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
# convert Global active power to numeric
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
# create png file
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()