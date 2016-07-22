HPC <- "./household_power_consumption.txt" #set name of file

dat <- read.table(HPC, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".") #read in file

subdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subdat$Date, subdat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(subdat$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()