dat <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
dat <- subset(dat, dat$Date =="1/2/2007" | dat$Date == "2/2/2007")

#create a new joint column with both date and time
dat$DateTime <- paste(dat$Date, plot_data$Time, sep=" ")

#convert to day of a week
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(dat$Date_Time, dat$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(dat$Date_Time, dat$Voltage, type = "l", xlab = "datetime", ylab ="Voltage")
plot(dat$Date_Time, dat$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(dat$Date_Time, dat$Sub_metering_2, col = "red")
lines(dat$Date_Time, dat$Sub_metering_3, col = "blue")
plot(dat$Date_Time, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")
legend("topright", lty=c(1,1, 1), bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()