# this script uses dplyr package. Install this package using install.packages("dplyr")

library(dplyr)
data1<- mutate(data, Date=as.Date(Date, "%d/%m/%Y")) # change data type to date
data2<- subset(data1, Date>="2007-02-01" & Date<="2007-02-02") # subset two dates
data2$DateTime <- paste(as.character(data2$Date), data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime, format="%Y-%m-%d %H:%M:%S")
data2<-mutate(data2,Global_active_power=as.numeric(Global_active_power)) # change data type to numeric
Sys.setlocale(category = "LC_TIME", locale = "C")
par(mar = c(5, 5, 2, 1), cex=0.7)
with(data2,plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (killowatts)", 
                xlab= ""))
dev.copy(png, file = "plot2.png")  ## Copy plot to a PNG file
dev.off() # close