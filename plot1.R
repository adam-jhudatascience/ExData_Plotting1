# This script produces Plot 1 for the first course project of
# "Exploratory Data Analysis", the fifth course of the 
# Johns Hopkins University Data Science specialisation on Coursera.

# Download the data.
temp <- tempfile()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption.txt"
download.file(url, temp, method="curl")
# Read only the data from the necessary dates into memory.
a1full <- read.table(unz(temp, filename), colClasses="character", header=T, sep=";")
a1data <- subset(a1full,Date=="1/2/2007" | Date=="2/2/2007")
rm(a1full)
unlink(temp)
# Now make the histogram.
hist(as.numeric(a1data$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

