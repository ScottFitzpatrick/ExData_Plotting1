### Exploratory Data Analysis - Course Project #1
        rm(list = ls())
# load electric power consumption data
        data <- read.table("C:/Users/SFitzpatrick/Desktop/Coursera/household_power_consumption.txt", 
                           header = TRUE, sep = ";", stringsAsFactors = FALSE)
# create date time combination
        data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        data$Time <- NULL
        library(lubridate)
        data$Date <- ymd_hms(data$Date)
# subset two day period that we would like to examine
        data <- data[data$Date > ymd("2007-02-01"), ]
        data <- data[data$Date < ymd("2007-02-03"), ]
# convert classes
        data$Global_active_power <- as.numeric(data$Global_active_power)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        data$Voltage <- as.numeric(data$Voltage)
        data$Global_intensity <- as.numeric(data$Global_intensity)
        data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
        data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

# plot2.R
        png(filename = "plot2.png")
        with(data, plot(Date, Global_active_power, 
                        type = "l", 
                        xlab = "", 
                        ylab = "Global Active Power (kilowatts)"))
        dev.off()