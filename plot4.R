# this script uses dplyr package. Install this package using install.packages("dplyr")
# this script uses data.table package. Install this package using install.packages("data.table")

library(data.table)
# Read data from file, set NA as "?"
data<-fread("household_power_consumption.txt",header=TRUE, na.strings = "?")

library(dplyr)
data1<- mutate(data, Date=as.Date(Date, "%d/%m/%Y")) #Change data type to date
data2<- subset(data1, Date>="2007-02-01" & Date<="2007-02-02") #Subset two dates

#Create new DateTime variable 
data2$DateTime <- paste(as.character(data2$Date), data2$Time)

#Convert to date in POSIXct format
data2$DateTime <- as.POSIXct(data2$DateTime, format="%Y-%m-%d %H:%M:%S")

#Change data type to numeric
data2<- mutate(data2,
                Global_active_power=as.numeric(Global_active_power),
                Voltage=as.numeric(Voltage),
                Global_reactive_power=as.numeric(Global_reactive_power),
                Sub_metering_1=as.numeric(Sub_metering_1),
                Sub_metering_2=as.numeric(Sub_metering_2))

#Set location to display axis marks in English (optional)
  Sys.setlocale(category = "LC_TIME", locale = "C")

  png(file="plot4.png", width=480,height=480,units="px") # Open PNG file device in WD

#Set margins and text size ratio and number of rows and columns
  par(mar = c(5, 5, 2, 1), cex=0.2, mfrow = c(2, 2))

#Create plot and send to a file
  with(data2,{
    plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (killowatts)", 
                    xlab= "")
    plot(DateTime,Voltage,type="l", ylab="Voltage", 
     xlab= "datetime")
    plot(DateTime,Sub_metering_1,type="l", ylab="Energy sub metering", xlab= "")
    lines(DateTime,Sub_metering_2, col="red")
    lines(DateTime,Sub_metering_3, col="blue")
    legend("topright", "(x,y)", cex=0.8, bty="n", pch = "___", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(DateTime,Global_reactive_power,type="l", ylab="Global_reactive_power", 
     xlab= "datetime")
})
dev.off() #Close PNG file device
