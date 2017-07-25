unzip("exdata_data_household_power_consumption.zip")
##Load data 
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
feb<- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

##Transform Date and Time 
feb$datetime <- strptime(paste(feb$Date, feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Create plot 2
plot(feb$datetime, feb$Global_active_power, typ="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()