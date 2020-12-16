```R
all_data <- read.table("C:/Users/Katya/Desktop/household_power_consumption/household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings = "?")
lab_data <- subset(all_data, Date=="1/2/2007" | Date =="2/2/2007")
```

```R
lab_data$Date <- as.Date(lab_data$Date,format = "%d/%m/%Y")
lab_data$DateTime<-strptime(paste(lab_data$Date,lab_data$Time),"%F %T")
```

```
png("C:/Users/Katya/Desktop/plot1.png", width=480, height=480)
hist(lab_data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot1.png)

```
png("C:/Users/Katya/Desktop/plot2.png", width=480, height=480)
plot(lab_data$DateTime,lab_data$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", type="l")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot2.png)
```
png("C:/Users/Katya/Desktop/plot3.png", width=480, height=480)
plot(lab_data$DateTime, lab_data$Sub_metering_1, type = "l", xlab = "",  ylab = "Energy sub metering")
lines(lab_data$DateTime, lab_data$Sub_metering_2, type = "l", col = "red")
lines(lab_data$DateTime, lab_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot3.png)

```
png("C:/Users/Katya/Desktop/plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(lab_data$DateTime, lab_data$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")

plot(lab_data$DateTime,lab_data$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(lab_data$DateTime,lab_data$Sub_metering_2, col="red", type="l")
points(lab_data$DateTime,lab_data$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(lab_data[,7:9]), bty="n")

plot(lab_data$DateTime, lab_data$Voltage, ylab="Voltage", xlab="datetime", type="l")

plot(lab_data$DateTime, lab_data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()
```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/plot4.png)
