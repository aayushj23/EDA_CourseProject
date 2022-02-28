complete_data <- read.table("data.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
complete_data$Date <- as.Date(complete_data$Date, format="%d/%m/%Y")

data <- subset(complete_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(complete_data)


time_date <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(time_date)


plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="Days Of Week")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
