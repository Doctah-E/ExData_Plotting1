# ExData course Assignment week 1
# Plot 1
library(dplyr)
library(summarytools)
library(lubridate)

data <- read.table("household_power_consumption.txt", 
                   header = T, sep = ";", na.strings = "?")
data <- data %>%  filter(Date== "1/2/2007" | Date== "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data$Date)
str(data$Date)

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime, tz = "")
head(data$DateTime)

# first try
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# save to png
png("plot1.png")
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()


