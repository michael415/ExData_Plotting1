# Script for reconstructing plot 3 of Course Project 1

# Read data
raw <- read.table("../data/household_power_consumption.txt", sep=";", na.strings = "?",
                  header=TRUE)

# Convert date column to date
raw$Date <- as.Date(as.character(raw$Date), format="%d/%m/%Y")

# Subset relevant dates, i.e. 2007-02-01 to 2007-02-02
data <- subset(raw, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

# Paste date and time together and format it
data$DateTime <- paste(data$Date, data$Time)
#data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

# Plot
locale <- Sys.getlocale(category = "LC_TIME")
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")
png("plot3.png", width=480, height=480, bg="transparent")
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Energy sub metering", 
     ylim=c(0, 38), type="n")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lwd=1 , col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
Sys.setlocale("LC_TIME", locale)