plot1<-function(path="D:\\exploratory\\ExData_Plotting1"){
	library(dplyr)
	#reading
	datag<-read.table(file.path(path,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings=c("","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

	#conversion of Date and Time columns to Date and POSIXct objects and filtering
      datag<-datag%>%mutate(datetime=as.POSIXct(paste(Date,",",Time),format="%d/%m/%Y , %H:%M:%S"))
	datag<-datag%>%mutate(Date=as.Date(Date,"%d/%m/%Y"))%>%filter(Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

	#Plotting
	png("plot1.png",height=480,width=480,units="px")
      with(datag,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power"))
	dev.off()
      
}