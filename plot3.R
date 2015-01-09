# this script uses dplyr package. Install this package using install.packages("dplyr")

library(dplyr)
data1<- mutate(data, Date=as.Date(Date, "%d/%m/%Y")) # change data type to date
data2<- subset(data1, Date>="2007-02-01" & Date<="2007-02-02") # subset two dates
data2$DateTime <- paste(as.character(data2$Date), data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime, format="%Y-%m-%d %H:%M:%S")
data2<-mutate(data2,Global_active_power=as.numeric(Global_active_power)) # change data type to numeric
data3<- mutate(data2,Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2))
Sys.setlocale(category = "LC_TIME", locale = "C")
par(mar = c(5, 5, 2, 1), cex=0.7)
with(data3,plot(DateTime,Sub_metering_1,type="l", ylab="Energy sub metering", xlab= ""))
with(data3,lines(DateTime,Sub_metering_2, col="red"))
with(data3,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright", pch = "___", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")  ## Copy plot to a PNG file
dev.off() # close