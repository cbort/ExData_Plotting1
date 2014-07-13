# The WD needs to be adjusted for your needs.
#setwd('D:/Users/cbort/Google Drive/Edu/Coursera/Exploratory Data Analysis/Project1')
dt = read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
dt$Date <- as.Date(strptime(dt$Date,"%d/%m/%Y"))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Voltage  <- as.numeric(dt$Voltage )
dt$Global_intensity <- as.numeric(dt$Global_intensity)
valid<- dt[dt$Date >= as.Date('2007-02-01') & dt$Date <= as.Date('2007-02-02'),]
png(filename="plot1.png")
with(valid,hist(Global_active_power, col='red', title='Global Active Power', xlab="Global Active Power (kilowatts)"))
dev.off()
