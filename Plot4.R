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

# Now we want to have 4 plots in one, so we need to use the function (also adjusting the margins, 
# so that the plots fit well enough):
par(mfrow=c(2,2), mar=c(4,4,2,1))
# This will add each plot next to each other, filling out by row.

# For the first plot (similar to plot number 2):
plot(finaldata$Datetime, finaldata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab=" ")

# Then for the second plot:
plot(finaldata$Datetime, finaldata$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

# The third plot is the same as in the previous assessment (plot 3):
plot(finaldata$Datetime, finaldata$Sub_metering_1, type="l", col="black", ylab = "Energy sub metering", xlab=" ") 
lines(finaldata$Datetime, finaldata$Sub_metering_2, type="l", col="red")
lines(finaldata$Datetime, finaldata$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=0.5, cex=0.75, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Finally, the fourth plot is a simple line plot again:
plot(finaldata$Datetime, finaldata$Global_reactive_power, type="l", xlab ="datetime", ylab="Global_reactive_power")