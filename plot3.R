dat <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
dat <- subset(dat, dat$Date =="1/2/2007" | dat$Date == "2/2/2007")

#create a new joint column with both date and time
dat$DateTime <- paste(dat$Date, plot_data$Time, sep=" ")

#convert to day of a week
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(dat$DateTime, dat$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright",lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()