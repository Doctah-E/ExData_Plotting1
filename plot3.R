# ExData course Assignment week 1
# Plot 3
library(dplyr)
library(ggplot2)
Sys.setlocale("LC_ALL", "English")

data <- read.table("household_power_consumption.txt", 
                   header = T, sep = ";", na.strings = "?")
data <- data %>%  filter(Date== "1/2/2007" | Date== "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime, tz = "")
data <- data %>% arrange(DateTime)

# first try
ggplot(data, aes(x = DateTime)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    theme(legend.position = c(0.8, 0.9)) +
    theme(plot.margin = margin(t= 5, r= 5, b= 5, l= 5)) +
    geom_line(aes(y=Sub_metering_1, color = "Sub_metering_1")) + 
    geom_line(aes(y=Sub_metering_2, color = "Sub_metering_2")) +
    geom_line(aes(y=Sub_metering_3, color = "Sub_metering_3")) +
    scale_color_manual("", 
                       breaks = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       values = c("black", "red", "blue")) + 
    ylab("Energy sub metering") +
    xlab("") + 
    scale_x_datetime(date_breaks = "1 days", date_labels = "%a")


# save to png
png("plot3.png")
ggplot(data, aes(x = DateTime)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    theme(legend.position = c(0.8, 0.9)) +
    theme(plot.margin = margin(t= 5, r= 5, b= 5, l= 5)) +
    geom_line(aes(y=Sub_metering_1, color = "Sub_metering_1")) + 
    geom_line(aes(y=Sub_metering_2, color = "Sub_metering_2")) +
    geom_line(aes(y=Sub_metering_3, color = "Sub_metering_3")) +
    scale_color_manual("", 
                       breaks = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       values = c("black", "red", "blue")) + 
    ylab("Energy sub metering") +
    xlab("") + 
    scale_x_datetime(date_breaks = "1 days", date_labels = "%a")
dev.off()


