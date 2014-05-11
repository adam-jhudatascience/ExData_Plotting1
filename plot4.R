# This script produces Plot 3 for the first course project of
# "Exploratory Data Analysis", the fifth course of the 
# Johns Hopkins University Data Science specialisation on Coursera.

# Download the data.
temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption.txt"
temp <- "exdata-data-household_power_consumption.zip"
download.file(url, temp, method="curl")
# Read only the data from the necessary dates into memory.
a1full <- read.table(unz(temp, filename), colClasses="character", header=T, sep=";")
a1data <- subset(a1full,Date=="1/2/2007" | Date=="2/2/2007")
rm(a1full)
unlink(temp)

# Now make the plot.
a1data$datetime <- as.POSIXct(mapply(paste,a1data$Date,a1data$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2))
plot(a1data$datetime,a1data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(a1data$datetime,a1data$Voltage,type="l",xlab="datetime",ylab="Global Active Power")
plot(a1data$datetime,a1data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(a1data$datetime,a1data$Sub_metering_2,col="red")
lines(a1data$datetime,a1data$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1)
plot(a1data$datetime,a1data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()