# this script uses dplyr package. Install this package using install.packages("dplyr")
library(dplyr)

data1<- mutate(data, Date=as.Date(Date, "%d/%m/%Y")) # change data type to date
data2<- subset(data1, Date>="2007-02-01" & Date<="2007-02-02") # subset two dates
data2<-mutate(data2,Global_active_power=as.numeric(Global_active_power)) # change data type to numeric
par(mar = c(5, 5, 2, 1), cex=0.7)par(mar = c(5, 5, 2, 1), cex=0.7)
hist(data2$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file = "plot1.png")  ## Copy plot to a PNG file
dev.off() #close
