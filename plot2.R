## Exploratory Data Analysis - Project 1
## PLOT-2

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

##Generate plot
plot(datetime, globalActivePower, type="l", 
        ylab="Global Active Power (kilowatts)")

## Saving to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()







