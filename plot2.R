library(data.table)
# The WD needs to be adjusted for your needs.
#setwd('D:/Users/cbort/Google Drive/Edu/Coursera/Exploratory Data Analysis')
dt = read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
dt$Date <- as.Date(strptime(dt$Date,"%d/%m/%Y"))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Voltage  <- as.numeric(dt$Voltage )
dt$Global_intensity <- as.numeric(dt$Global_intensity)
valid<- data.table(dt[dt$Date >= as.Date('2007-02-01') & dt$Date <= as.Date('2007-02-02'),])
valid[,DateTime:=as.POSIXct(paste(valid$Date,valid$Time))]
valid[,Day_of_Week:=weekdays(dt$Date)]
png(filename="plot2.png")
with(valid,plot(DateTime,Global_active_power,type='line',ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
