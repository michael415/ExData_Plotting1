# Script for reconstructing plot 1 of Course Project 1
 
# Read data
raw <- read.table("../data/household_power_consumption.txt", sep=";", na.strings = "?",
                  header=TRUE)

# Convert date column to date
raw$Date <- as.Date(as.character(raw$Date), format="%d/%m/%Y")

# Subset relevant dates, i.e. 2007-02-01 to 2007-02-02
data <- subset(raw, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

# Plot a histogram of the Global Active Power
png("plot1.png", width=480, height=480, bg="transparent")
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col=c("red"))
dev.off()