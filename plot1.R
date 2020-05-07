url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power_consumption.zip")
unzip("power_consumption.zip")
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
#subset to just "2007-02-01" and "2007-02-02"
mydata2 <- subset(mydata, Date == "1/2/2007"|Date == "2/2/2007")
#convert date time to single DateTime column
mydata2$DateTime <- strptime(paste(mydata2$Date, mydata2$Time), "%d/%m/%Y %H:%M:%S")
#open png file
png("plot1.png")
#plot
hist(mydata2$Global_active_power, 
     type = "h", 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
#close png
dev.off()