## Exploratory Data Analysis - Project 1
## PLOT-1

## Read datafile
datafile 		<- "../../data/household_power_consumption.txt"
data 			<- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Select desired data
#data_sub 		<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Date 		<- as.Date(data$Date, format="%d/%m/%Y")
data_sub 		<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Change plot attribute to Numeric
globalActivePower <- as.numeric(data_sub$Global_active_power)

##Generate plot
hist(globalActivePower, col="red", main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Saving to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()







