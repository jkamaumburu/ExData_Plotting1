
#Load data into R
powerData<-read.table("household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Convert Date column to Date data type
powerData$Date<-as.Date(powerData$Date,'%d/%m/%Y')


#subset data to leave data for dates 2007-02-01 and 2007-02-02 only 
subsetPowerData<-filter(powerData, Date >= "2007-02-01", Date <= "2007-02-02")

#Join the date and time column together
subsetPowerData$newDate<-paste(subsetPowerData$Date,subsetPowerData$Time)

library(lubridate)

#Convert newDate 
subsetPowerData$newDate<-ymd_hms(subsetPowerData$newDate)

#Set working Directory so that maps can be saved in that 
setwd("C:/Program Files/Git/usr/Exploratory Data Analysis/ExData_Plotting1")

#Open device plot1.png
png(file="plot3.png", width = 480 , height = 480 )

#Plot Lines
with(subsetPowerData,plot(newDate,Sub_metering_1,col="black", type = 'l', ylab = "Energy sub metering ", xlab = ''))
with(subsetPowerData,points(newDate,Sub_metering_2,col="red", type = 'l'))
with(subsetPowerData,points(newDate,Sub_metering_3,col="blue", type = 'l'))

#Add Legend
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Close PNG device
dev.off()