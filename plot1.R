##Read the data
##With the help of sqldf, read in only the data we are interested in
library(sqldf)
data2<- read.csv2.sql("household_power_consumption.txt", sep = ";", ns.strings="?", sql = 'select * from file where Date == "1/2/2007"  or Date == "2/2/2007"  ')

## Set the png parameters
png("plot1.png", width=480, height=480)
par(mar=rep(5,5,4,2)) # marginal on 4 sides
##plot the histogram with  specified title, color and xlabel
hist(data2$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)", col="red" )
dev.off()