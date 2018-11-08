library(lubridate)
Sys.setlocale("LC_TIME", "English")

powerData <- subset(read.table("household_power_consumption.txt", sep = ';', na.strings = '?', header = TRUE),
                    Date == "1/2/2007" | Date == "2/2/2007")

powerData$datetime <- strptime(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2,2))

with(powerData, plot(datetime, Global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)",
                     xlab = ""))

with(powerData, plot(datetime, Voltage, type = "l"))

with(powerData, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerData, lines(datetime, Sub_metering_2, col = "red"))
with(powerData, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", inset = .01,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       box.lty = 0)

with(powerData, plot(datetime, Global_reactive_power, type = "l"))

dev.off()