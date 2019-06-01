plot4<-function(path="D:\\exploratory\\ExData_Plotting1"){
	library(dplyr)
	#reading
	datag<-read.table(file.path(path,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings=c("","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

	#conversion of Date and Time columns to Date and POSIXct objects and filtering
      datag<-datag%>%mutate(datetime=as.POSIXct(paste(Date,",",Time),format="%d/%m/%Y , %H:%M:%S"))
	datag<-datag%>%mutate(Date=as.Date(Date,"%d/%m/%Y"))%>%filter(Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

	#Plotting
	png("plot4.png",height=480,width=480,units="px")
	par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(2,2,2,2))
	with(datag,plot(datetime,Global_active_power,type="n",xlab=""))
	lines(datag$datetime,datag$Global_active_power)

      with(datag,plot(datetime,Global_active_power,type="n",xlab="",ylab="Energy sub metering",ylim=c(0,40)))
	lines(datag$datetime,datag$Sub_metering_1,col="black")
	lines(datag$datetime,datag$Sub_metering_2,col="red")
	lines(datag$datetime,datag$Sub_metering_3,col="blue")
	legend("topright",col=c("black","red","blue"),lty=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	
	with(datag,plot(datetime,Voltage,type="n"))
	lines(datag$datetime,datag$Voltage)

	with(datag, plot(datetime, Global_reactive_power,type="n"))
	lines(datag$datetime,datag$Global_reactive_power)
	dev.off()
      
}