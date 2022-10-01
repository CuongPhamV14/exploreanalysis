# Exploraroty Data Analysis Course
# Course project 1: plot 4
# by Cuong Pham V


library(lubridate)

## 1: Reading data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

## 2: Create a full day/time column and convert it to POSIXct object

mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$full_date <- paste0(mydata$Date, " " , mydata$Time)
mydata$full_date <- as_datetime(mydata$full_date)


## 3:select  data from 2007-02-01 to 2007-02-02

subdat <- mydata[which(mydata$Date %in% as.Date(c("2007-02-01", "2007-02-02"))),] 

## 4: Change columns with energy submetering to numeric

energy_columns <- grepl("Sub_metering", colnames(subdat), fixed=F)
subdat[,energy_columns] <- lapply(subdat[,energy_columns], function(x) {as.numeric(x)})

## 5: Change column "Global Active Power", "Global Rective Power", "Voltage" to numeric

power_columns <- grepl("Sub_metering", colnames(subdat), fixed=F)
subdat[,power_columns] <- lapply(subdat[,power_columns], function(x) {as.numeric(x)})
subdat$Voltage <- as.numeric(subdat$Voltage)


## 6: Plotting

png(filename="plot4.png", width=480, height = 480 )

# change par to accomodate 4 plots in 2 rows and 2 columns

par(mfrow=c(2,2))

# plot1) Global Active power vs. Weekday-Time
with(subdat, plot(Global_active_power~full_date, type='l', 
                            xlab = "", ylab="Global Active Power (kilowatts)" ))

# plot 2) Voltage vs. Weekday-Time
with(subdat, plot(Voltage~full_date, type='l', 
                            xlab = "datetime"))


# plot 3) Energy submetering vs. Weekday-time
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
       bty = "n",
       col= c("black", "red", "blue"), lwd = 1, cex=0.8)

#4) Global re-ctive power vs. Weekday-Time
with(subdat, plot(Global_reactive_power~full_date, type='l', 
                            xlab = "datetime"))



dev.off()
