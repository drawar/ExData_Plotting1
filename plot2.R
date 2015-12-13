dat <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
dat <- subset(dat, dat$Date =="1/2/2007" | dat$Date == "2/2/2007")

#create a new joint column with both date and time
dat$DateTime <- paste(dat$Date, plot_data$Time, sep=" ")

#convert to day of a week
dat$DateTime <- strptime(dat$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(dat$DateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()