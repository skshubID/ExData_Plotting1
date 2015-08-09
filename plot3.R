## Exploratory Data Analysis - Project 1
## PLOT-3

## Read datafile
datafile 		<- "../../data/household_power_consumption.txt"
data 			<- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Select desired data
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#data$Date 		<- as.Date(data$Date, format="%d/%m/%Y")
#data_sub 		<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Setting plot attributes
globalActivePower <- as.numeric(data_sub$Global_active_power)
datetime 		<- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 	<- as.numeric(data_sub$Sub_metering_1)
subMetering2 	<- as.numeric(data_sub$Sub_metering_2)
subMetering3 	<- as.numeric(data_sub$Sub_metering_3)

##Generate plot
plot(datetime, subMetering1, 	type="l", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Saving to PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
