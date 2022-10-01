
# Exploraroty Data Analysis Course
# Course project 1: plot 1
# By Cuong Pham V




## 1. Reading data from txt file into mydata
mydata <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

## 2. Convert Date column to date object
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")


## 3. Extract data for the following days 2007-02-01 and 2007-02-02.
subdata <- mydata[which(mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 


## 4. Change column "Global Active Power" to numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)


## 5. Plot histogram 

png(filename="plot1.png", width=480, height = 480 )

par(las=1)

hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
