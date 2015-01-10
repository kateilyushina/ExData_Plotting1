# this script uses dplyr package. Install this package using install.packages("dplyr")
# this script uses data.table package. Install this package using install.packages("data.table")

library(data.table)
# Read data from file, set NA as "?"
  data<-fread("household_power_consumption.txt",header=TRUE, na.strings = "?")

library(dplyr)
  data1<- mutate(data, Date=as.Date(Date, "%d/%m/%Y")) #Change data type to date
    data2<- subset(data1, Date>="2007-02-01" & Date<="2007-02-02") #Subset two dates
      data2<-mutate(data2,Global_active_power=as.numeric(Global_active_power)) #Change data type to numeric

png(file="plot1.png", width=480,height=480,units="px") # Open PNG file device in WD
  par(mar = c(5, 5, 2, 1), cex=0.7) # Set margins and text size ratio

#Create histogram and send to a file
  hist(data2$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
  dev.off() #close PNG file device
