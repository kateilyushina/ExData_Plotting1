data3<- mutate(data2,Voltage=as.numeric(Voltage),
               Global_reactive_power=as.numeric(Global_reactive_power))







par(mar = c(5, 5, 2, 1), cex=0.2, mfrow = c(2, 2))
with(data3,{
    plot(DateTime,Global_active_power,type="l", ylab="Global Active Power (killowatts)", 
                    xlab= "")
    plot(DateTime,Voltage,type="l", ylab="Voltage", 
     xlab= "datetime")
    plot(DateTime,Sub_metering_1,type="l", ylab="Energy sub metering", xlab= "")
    lines(DateTime,Sub_metering_2, col="red")
    lines(DateTime,Sub_metering_3, col="blue")
    legend("topright", cex=0.6, bty="n", pch = "___", col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    plot(DateTime,Global_reactive_power,type="l", ylab="Global_reactive_power", 
     xlab= "datetime")
})
dev.copy(png, file = "plot4.png")  ## Copy plot to a PNG file
dev.off() # close
