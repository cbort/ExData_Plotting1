library(data.table)
# The WD needs to be adjusted for your needs.
#setwd('D:/Users/cbort/Google Drive/Edu/Coursera/Exploratory Data Analysis')
dt = read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
dt$Date <- as.Date(strptime(dt$Date,"%d/%m/%Y"))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Global_reactive_power <- as.numeric(dt$Global_reactive_power)
dt$Voltage  <- as.numeric(dt$Voltage )
dt$Global_intensity <- as.numeric(dt$Global_intensity)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
valid<- data.table(dt[dt$Date >= as.Date('2007-02-01') & dt$Date <= as.Date('2007-02-02'),])
valid[,DateTime:=as.POSIXct(paste(valid$Date,valid$Time))]

png(filename="plot4.png")
par(mfrow=c(2,2))
with(valid, plot(DateTime,Global_active_power,type='l',ylab="Global Active Power", xlab=""))
with(valid, plot(DateTime,Voltage,type='l',ylab="Voltage", xlab="datetime"))
with(valid, plot(DateTime,Sub_metering_1,type='l', col='black',ylab="Energy sub metering",xlab=""))
with(valid, points(DateTime,Sub_metering_2,col='red', type='l'))
with(valid, points(DateTime,Sub_metering_3,col='blue', type='l'))
legend("topright",lty="solid",bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), border=0)
with(valid, plot(DateTime, Global_reactive_power, xlab="datetime", type="l", lwd="0.01" ))
dev.off()


