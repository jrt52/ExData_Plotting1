unzip("exdata_data_household_power_consumption.zip")
##Load data 
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
feb<- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

##Transform Date and Time 
feb$datetime <- strptime(paste(feb$Date, feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Create plot 3

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 

plot(feb$datetime, feb$Sub_metering_1, typ="l", xlab = "", ylab="Energy Submetering")
lines(feb$datetime, feb$Sub_metering_2, col="Red")
lines(feb$datetime, feb$Sub_metering_3, col="Blue")

##Create Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()