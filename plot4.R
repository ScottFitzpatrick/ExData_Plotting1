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

# plot4.R
        png(filename = "plot4.png")
        par(mfcol = c(2, 2))
        # plot 1
        with(data, plot(Date, Global_active_power, 
                        type = "l", 
                        xlab = "", 
                        ylab = "Global Active Power (kilowatts)"))
        # plot 2
        with(data, plot(Date, Sub_metering_1, 
                        type = "n", 
                        xlab = "", 
                        ylab = "Energy sub metering"))
        points(data$Date, data$Sub_metering_1, 
               type = "l", 
               col = "black")
        points(data$Date, data$Sub_metering_2, 
               type = "l", 
               col = "red")        
        points(data$Date, data$Sub_metering_3, 
               type = "l", 
               col = "blue")      
        legend("topright", 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = 1, 
               col = c("black", "red", "blue"))
        # plot 3
        with(data, plot(Date, Voltage, 
                        type = "l", 
                        xlab = "datetime", 
                        ylab = "Voltage"))
        # plot 4
        with(data, plot(Date, Global_reactive_power, 
                        type = "l", 
                        xlab = "datetime", 
                        ylab = "Global_reactive_power"))
        dev.off()