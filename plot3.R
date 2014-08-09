## Read the data into a table
elpowdata <- read.table("household_power_consumption.txt", sep= ";", header=TRUE)
## Subset the required dates
subselpow <- elpowdata[(elpowdata$Date == "2/2/2007" | elpowdata$Date == "1/2/2007"), ]
## Convert the dates to the suggested date and time format
## check if there is any NA in the subset 
newDate <- paste(subselpow$Date, subselpow$Time)
subselpow$Date <- strptime(newDate, "%d/%m/%Y %H:%M:%S") 
subselpow <- subselpow[,c(1,3:9)]
any(apply(subselpow[,2:8], 2, function(x) grepl("\\?",x)))
## Open the png device, create the file, the default size is 480x480, so no need to modify
png(file = "plot3.png")
## Create the plot
plot(subselpow$Date, as.numeric(as.character(subselpow$Sub_metering_1)), pch = NA,
     ylab = "Energy sub metering", xlab = "")
lines(subselpow$Date, as.numeric(as.character(subselpow$Sub_metering_1)))
lines(subselpow$Date, as.numeric(as.character(subselpow$Sub_metering_2)), col = "red")
lines(subselpow$Date, as.numeric(as.character(subselpow$Sub_metering_3)), col = "blue")
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Closse the png device
dev.off()