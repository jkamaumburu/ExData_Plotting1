
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
png(file="plot2.png", width = 480 , height = 480 )

#Create plot
plot(subsetPowerData$newDate,subsetPowerData$Global_active_power, type = 'l',ylab = "Global Active Power (kilowatts)", xlab = '')

#Close PNG device
dev.off()