unzip("exdata_data_household_power_consumption.zip")
##Load data 
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##Transform Date and Time 
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <-strptime(power$Time, format="%H:%M:%S")

#Subset by dates 2007-02-01 and 2007-02-02
feb<-subset(power, subset =(Date == "2007-02-01" | Date == "2007-02-02"))

#Create DateTime(combined Date and Time)
datetime <- paste(as.Date(feb$Date), feb$Time)
feb$datetime <- as.POSIXct(datetime)

##Create plot 2
plot(feb$datetime, feb$Global_active_power, typ="l", xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()