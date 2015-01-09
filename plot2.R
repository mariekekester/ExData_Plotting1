#read in the first 70000 rows of data to reduce read time for computer
#specify what class each column is ahead of time so numbers are read as numbers rather than factors
elec <- read.table("./household_power_consumption 2.txt", header=T, sep=";", nrows=70000, colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric","numeric"), na.strings = "?")

#set Date to date format
elec$Date <- as.Date(elec$Date, format="%d/%m/%Y")

#only want dates 2007-02-01 and 2007-02-02
selec <- subset(elec, Date=="2007-02-01" | Date=="2007-02-02")

#need to be able to read the time for plot 2
selec$DateTime <- paste(selec$Date, selec$Time)
selec$DateTime <- strptime(selec$DateTime, format="%Y-%m-%d %H:%M:%S")

###############
#plot 2
################
with(selec, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file = "plot2.png", width = 480, height = 480)  
dev.off()