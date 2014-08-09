##Read the data
##With the help of sqldf, read in only the data we are interested in
library(sqldf)
data2<- read.csv2.sql("household_power_consumption.txt", sep = ";", ns.strings="?", sql = 'select * from file where Date == "1/2/2007"  or Date == "2/2/2007"  ')

## Set the png parameters
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2)) # 2 rows x 2 columns
par(oma=c(0.0,0,0,0)) #Set outer plot margin

## Paste($Date, $Time) to combine the date and time together
## Then use strptime to convert it to weekdays
data2weekday <- strptime( paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S" )

##Plot the first figure on Global active power
plot(data2weekday,data2$Global_active_power,main=" ", type="l",xlab=" ",ylab = "Global Active Power" )


##second plot: plot the time series plot for sub-metering_(1 to 3) with  specified title and ylabel
plot(data2weekday,data2$Sub_metering_1,main=" ", type="l",xlab=" ",ylab = "Energy sub-metering",lwd=1 )
lines(data2weekday,data2$Sub_metering_2,  col="red",lwd=1)
lines(data2weekday,data2$Sub_metering_3, col="blue",lwd=1)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),#legend for lines
       lwd=c(1,1,1), #linewidth for the curves
       col=c("black","red","blue"),
       bty = "n" # no boundary
       )
##Third plot
plot(data2weekday,data2$Voltage,main=" ", type="l",xlab="datetime ",ylab = "Voltage" )
##Fourth plot
plot(data2weekday,data2$Global_reactive_power,main=" ", type="l",xlab="datetime",ylab = "Global_Reactive_Power" )
dev.off()
