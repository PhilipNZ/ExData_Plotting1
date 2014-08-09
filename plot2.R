##Read the data
##With the help of sqldf, read in only the data we are interested in
library(sqldf)
data2<- read.csv2.sql("household_power_consumption.txt", sep = ";", ns.strings="?", sql = 'select * from file where Date == "1/2/2007"  or Date == "2/2/2007"  ')

## Set the png parameters
png("plot2.png", width=480, height=480)
par(mar=rep(5,5,4,2))
## Paste($Date, $Time) to combine the date and time together
## Then use strptime to convert it to weekdays
data2weekday <- strptime( paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S" )
##plot the time series plot for Global active power with  specified title and ylabel
plot(data2weekday,data2$Global_active_power,main=" ", type="l",xlab=" ",ylab = "Global Active Power (kilowatts)" )
dev.off()
