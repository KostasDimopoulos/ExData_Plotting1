# First, to read the data:
electricity <- read.table("household_power_consumption.txt", header = T, sep=";", 
               comment.char="%", stringsAsFactors=FALSE, na.strings="?")

# Then to subset for only the dates we want to use for the exercise:
finaldata <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007") 

# To create plot 1, which is a histogram:

hist(finaldata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
