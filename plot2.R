library(lubridate)
Sys.setlocale("LC_TIME", "English")

powerData <- subset(read.table("household_power_consumption.txt", sep = ';', na.strings = '?', header = TRUE),
                    Date == "1/2/2007" | Date == "2/2/2007")

powerData$datetime <- strptime(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")
with(powerData, plot(datetime, Global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)",
                     xlab = ""))
dev.off()