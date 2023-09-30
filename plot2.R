# ExData course Assignment week 1
# Plot 2
library(dplyr)
library(ggplot2)
Sys.setlocale("LC_ALL", "English")


data <- read.table("household_power_consumption.txt", 
                   header = T, sep = ";", na.strings = "?")
data <- data %>%  filter(Date== "1/2/2007" | Date== "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
head(data$Date)
str(data$Date)

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime, tz = "")
head(data$DateTime)
data <- data %>% arrange(DateTime)

# first try
ggplot(data, aes(x = DateTime, y = Global_active_power)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    geom_line() + 
    ylab("Global Active Power (kilowatts)") +
    xlab("") + 
    scale_x_datetime(date_breaks = "1 days",
                     date_labels = "%a")

# save to png
png("plot2.png")
ggplot(data, aes(x = DateTime, y = Global_active_power)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    geom_line() + 
    ylab("Global Active Power (kilowatts)") +
    xlab("") + 
    scale_x_datetime(date_breaks = "1 days",
                     date_labels = "%a")
dev.off()


