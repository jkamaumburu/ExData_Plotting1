
#Load data into R
powerData<-read.table("household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

#Convert Date column to Date data type
powerData$Date<-as.Date(powerData$Date,'%d/%m/%Y')


#subset data to leave data for dates 2007-02-01 and 2007-02-02 only 
subsetPowerData<-filter(powerData, Date >= "2007-02-01", Date <= "2007-02-02")

#Set working Directory so that maps can be saved in that 
setwd("C:/Program Files/Git/usr/Exploratory Data Analysis/ExData_Plotting1")

#Open device plot1.png
png(file="plot1.png", width = 480 , height = 480 )

#Convert Global_active_power column to NUMERIC data type then divide by 1000 to make the units in kilowatts
subsetPowerData$Global_active_power<-as.numeric(subsetPowerData$Global_active_power )/1000

#Create plot/histogram
hist( subsetPowerData$Global_active_power ,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Close PNG device
dev.off()