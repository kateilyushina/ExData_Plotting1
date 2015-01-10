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
    data2<-mutate(data2,Global_active_power=as.numeric(Global_active_power)) 

#Set location to display axis marks in English (optional)
Sys.setlocale(category = "LC_TIME", locale = "C")

png(file="plot2.png", width=480,height=480,units="px") # Open PNG file device in WD
  par(mar = c(5, 5, 2, 1), cex=0.7) # Set margins and text size ratio
    
#Create plot and send to a file
    with(data2,plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (killowatts)", 
                xlab= ""))
dev.off() # close PNG file device