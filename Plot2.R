# First, to read the data:
electricity <- read.table("household_power_consumption.txt", header = T, sep=";", 
               comment.char="%", stringsAsFactors=FALSE, na.strings="?")

# Then to subset for only the dates we want to use for the exercise:
finaldata <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007") 


# To create plot 2, which is a plot (using type=l):
plot(finaldata$Time, finaldata$Global_active_power, type=l)

# We then take the two columns Date, and Time, because we want to merge them and convert them from character to date:
time <- finaldata$Time
date <- finaldata$Date

# To merge date and time:
datetime <- paste(date, time, sep=" ")

# To transform the character vector "datetime" to date:
datetime <- strptime(datetime,  "%d/%m/%Y %H:%M:%S")

# To add this extra column to our dataset:
finaldata$Datetime <- datetime

# To create plot 2, which is a plot (using type="l"):
plot(finaldata$Datetime, finaldata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab=" ")

