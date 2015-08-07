# First, to read the data:
electricity <- read.table("household_power_consumption.txt", header = T, sep=";", 
               comment.char="%", stringsAsFactors=FALSE, na.strings="?")

# Then to subset for only the dates we want to use for the exercise:
finaldata <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007") 

# We then take the two columns Date, and Time, because we want to merge them and convert them from character to date:
time <- finaldata$Time
date <- finaldata$Date

# To merge date and time:
datetime <- paste(date, time, sep=" ")

# To transform the character vector "datetime" to date:
datetime <- strptime(datetime,  "%d/%m/%Y %H:%M:%S")

# To add this extra column to our dataset:
finaldata$Datetime <- datetime

# To create plot 3, which is a plot (using type="l") for three different y values, we need to use
# "lines" to overlay each y value on the previous plot and add a legend at the end:
plot(finaldata$Datetime, finaldata$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering", xlab=" ") 
lines(finaldata$Datetime, finaldata$Sub_metering_2, type="l", col="red")
lines(finaldata$Datetime, finaldata$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.80, 
       lwd=1, col=c("black", "red", "blue"))