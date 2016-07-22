HPC <- "./household_power_consumption.txt" #set name of file

dat <- read.table(HPC, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") #read in file

subdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subdat$Global_active_power)
grp <- as.numeric(subdat$Global_reactive_power)
voltage <- as.numeric(subdat$Voltage)
subM1 <- as.numeric(subdat$Sub_metering_1)
subM2 <- as.numeric(subdat$Sub_metering_2)
subM3 <- as.numeric(subdat$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex = 0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab = "")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")



plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()