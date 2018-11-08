library(lubridate)
Sys.setlocale("LC_TIME", "English")

powerData <- subset(read.table("household_power_consumption.txt", sep = ';', na.strings = '?', header = TRUE),
                    Date == "1/2/2007" | Date == "2/2/2007")

powerData$datetime <- strptime(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot1.png")
with(powerData, hist(Global_active_power, 
                     col = "red", 
                     main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)"))
dev.off()