url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power_consumption.zip")
unzip("power_consumption.zip")
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
#subset to just "2007-02-01" and "2007-02-02"
mydata2 <- subset(mydata, Date == "1/2/2007"|Date == "2/2/2007")
#convert date time to single DateTime column
mydata2$DateTime <- strptime(paste(mydata2$Date, mydata2$Time), "%d/%m/%Y %H:%M:%S")
#open png
png("plot4.png")
#set up par to be 2 x 2 and fill by columns
par(mfcol = c(2, 2))
#plot topleft
plot(mydata2$DateTime, mydata2$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")
#plot botleft
plot(mydata2$DateTime, mydata2$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering", 
     xlab = "", 
     col = "black")
points(mydata2$DateTime, mydata2$Sub_metering_2, col = "red", type = "l")
points(mydata2$DateTime, mydata2$Sub_metering_3, col = "blue", type = "l")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       bty = "n")
#plot topright
plot(mydata2$DateTime, mydata2$Voltage, 
     type = "l",
     ylab = "Voltage", 
     xlab = "datetime")
#plot botright
plot(mydata2$DateTime, mydata2$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power", 
     xlab = "datetime")
#close png
dev.off()