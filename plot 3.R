# Exploraroty Data Analysis Course
# Course project 1: plot 2
# by Cuong Pham V

setwd("/Users/cuongpham/Dropbox/Data work/Data Science/Course 4 - Exploratory Data Analysis/")

library(lubridate)

## 1: Reading data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

## 2: Create a full day/time column and convert it to POSIXct object

mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$full_date <- paste0(mydata$Date, " " , data$Time)
mydata$full_date <- as_datetime(mydata$full_date)


## 3:select  data from 2007-02-01 to 2007-02-02

subdat <- mydata[which(mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 


## 4: Change columns with energy submetering to numeric

energy_columns <- grepl("Sub_metering", colnames(subdat), fixed=F)
subdat[,energy_columns] <- lapply(subdat[,energy_columns], function(x) {as.numeric(x)})



## 5: Plotting line plot - Energy sub metering vs. weekdays

png(filename="plot3.png", width=480, height = 480 )


with(subdat, plot(Sub_metering_1~full_date, type='l',
                            col = "black",
                            xlab = "", ylab="Energy sub metering" ))

with(subdat, lines(Sub_metering_2~full_date,
                             col = "red",
                             xlab = "", ylab="Energy sub metering" ))


with(subdat, lines(Sub_metering_3~full_date,
                             col = "blue",
                             xlab = "", ylab="Energy sub metering" ))

# adding legend in the right top corner

legend("topright", legend=c(colnames(subdat[,energy_columns])), 
       col= c("black", "red", "blue"), lwd = 1, cex=0.75)

dev.off()