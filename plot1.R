## Read the data into a table
elpowdata <- read.table("household_power_consumption.txt", sep= ";", header=TRUE)
## Subset the required dates
subselpow <- elpowdata[(elpowdata$Date == "2/2/2007" | elpowdata$Date == "1/2/2007"), ]
## check if there is any NA in the subset 
any(apply(subselpow[,3:9], 2, function(x) grepl("\\?",x)))
## Open the png device, create the file, the default size is 480x480, so no need to modify
png(file = "plot1.png")
## Create the plot
hist(as.numeric(as.character(subselpow$Global_active_power)), col = "red", 
     main = "Global Active Power", xlab="Global Active Power (kilowatts)")
## Closse the png device
dev.off()
