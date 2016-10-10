library(lubridate)
library(datasets)
#CourseProject1 practice code file
#r_num is the number of rows that include information between the dates 1/2/2007(66648) and 2/2/2007(69517)

hpc_data<- read.table("household_power_consumption.txt",sep = ";", skip = 66648, nrow=(69517-66648), stringsAsFactors = FALSE, na.strings = )
colnames(hpc_data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

wdays<-data.frame(weekdays(as.Date(hpc_data$Date,'%d/%m/%Y')))
names(wdays)<- "weekdays"
hpc_data<- cbind(hpc_data,wdays)
gap= hpc_data$Global_active_power

#PLOT 4
png(filename = "plot4.png",width = 480,height = 480, bg="white")
par(mfrow=c(2,2),mar=c(4,4,2,1))
with(hpc_data,{
  plot(days1,gap,ylab="Global Active Power",type = "l",xlab = "")
  plot(days1, hpc_data$Voltage, ylab="Voltage", type="l",xlab = "datetime")
  plot(days1,hpc_data$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
  points(days1,hpc_data$Sub_metering_2,type = "l", col ="red")
  points(days1,hpc_data$Sub_metering_3,type = "l", col = "blue")
  legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"))
  plot(days1, hpc_data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
})
dev.off()
