# ExData course Assignment week 1
# Plot 4
library(dplyr)
library(ggplot2)
library(gridExtra)
Sys.setlocale("LC_ALL", "English")

data <- read.table("household_power_consumption.txt", 
                   header = T, sep = ";", na.strings = "?")
data <- data %>%  filter(Date== "1/2/2007" | Date== "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime, tz = "")
data <- data %>% arrange(DateTime)

# new graph top right
g2 <- ggplot(data, aes(x = DateTime, y = Voltage)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    theme(plot.margin = margin(t= 5, r= 5, b= 5, l= 5)) +
    geom_line() + 
    scale_x_datetime(date_breaks = "1 days", date_labels = "%a")
g2

# new graph bottom right
g4 <- ggplot(data, aes(x = DateTime, y = Global_reactive_power)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    theme(plot.margin = margin(t= 5, r= 5, b= 5, l= 5)) +
    geom_line() + 
    scale_x_datetime(date_breaks = "1 days", date_labels = "%a")
g4

# graphs previous plots 
g1 <- ggplot(data, aes(x = DateTime, y = Global_active_power)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    geom_line() + 
    ylab("Global Active Power (kilowatts)") +
    xlab("") + 
    scale_x_datetime(date_breaks = "1 days",
                     date_labels = "%a")

g3 <- ggplot(data, aes(x = DateTime)) +
    theme(panel.background = element_rect(fill = "white", colour = "black")) +
    theme(legend.position = c(0.75, 0.85)) +
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

# combine graphs
grid.arrange(g1, g2, g3, g4, ncol = 2)

# save to png
png("plot4.png")
grid.arrange(g1, g2, g3, g4, ncol = 2)
dev.off()


