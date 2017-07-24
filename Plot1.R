unzip("exdata_data_household_power_consumption.zip")
##Load data 
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Subset by dates 2007-02-01 and 2007-02-02
feb<-subset(power, subset =(Date == "2007-02-01" | Date == "2007-02-02"))

##Create plot 1
hist(as.numeric(as.character(feb$Global_active_power)), col="red", main= "Global Active Power",
     xlab="Global Active Power(kilowatts)" )

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()