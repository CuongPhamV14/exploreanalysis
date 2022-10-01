# Exploraroty Data Analysis Course
# Course project 1: plot 1
# by Cuong Pham V


library(lubridate)

## 1: Reading data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)


## 2: Create a full day/time column and convert it to POSIXct object

mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$full_date <- paste0(mydata$Date, " " , data$Time)
mydata$full_date <- as_datetime(mydata$full_date)


## 3:Extract data for the following days 2007-02-01, 2007-02-02

subdat <- mydata[which(mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 


## 4: Change column "Global Active Power" to numeric
subdat$Global_active_power <- as.numeric(subdat$Global_active_power)


## Step6: Plotting line plot - Global Active Power vs. weekdays
png(filename="plot2.png", width=480, height = 480 )

with(subdat, plot(Global_active_power~full_date, type='l', 
                            xlab = "", ylab="Global Active Power (kilowatts)" ))

dev.off()
