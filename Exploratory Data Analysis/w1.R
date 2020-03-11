pollution <- read.csv("avgpm25.csv", colClasses=c("numeric","character","factor","numeric","numeric"))
head(pollution)

summary(pollution$pm25)

boxplot(pollution$pm25, col="blue")

hist(pollution$pm25, col="green")
rug(pollution$pm25)

hist(pollution$pm25, col="green", breaks=100)
rug(pollution$pm25)

boxplot(pollution$pm25, col="blue")
abline(h=12)

hist(pollution$pm25, col="green")
abline(v=12, lwd=2)
abline(v=median(pollution$pm25),col="magenta",lwd=4)

barplot(table(pollution$region), col="wheat", main="# of counties in each region")

boxplot(pm25 ~ region, data=pollution, col="red")

par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(pollution, region=="east")$pm25, col="green")
hist(subset(pollution, region=="west")$pm25, col="green")

with(pollution, plot(latitude, pm25))
abline(h=12,lwd=2,lty=2)

with(pollution, plot(latitude, pm25, col=region))
abline(h=12,lwd=2,lty=2)

library(datasets)
data(cars)
with(cars, plot(speed, dist))


par(mfrow=c(1,2), mar=c(5,4,2,1))
with(subset(pollution, region=="west"), plot(latitude, pm25, main="West"))
with(subset(pollution, region=="east"), plot(latitude, pm25, main="East"))


library(lattice)
state <- data.frame(state.x77, region=state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout=c(4,1))

#####################
par(mfrow=c(1,4), mar=c(4,4,2,1))
boxplot(subset(state, region=="Northeast")$Life.Exp, col="green", main = "Northeast")
boxplot(subset(state, region=="West")$Life.Exp, col="green", main = "West")
boxplot(subset(state, region=="South")$Life.Exp, col="green", main = "South")
boxplot(subset(state, region=="North Central")$Life.Exp, col="green", main = "North Central")
#####################

library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)


library(datasets)
hist(airquality$Ozone)

with(airquality,plot(Wind, Ozone))
title(main="Ozone and Wind in New York City")

with(airquality,plot(Wind, Ozone, main="Ozone and Wind in New York City"))
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))

with(airquality,plot(Wind, Ozone, main="Ozone and Wind in New York City"), type="n")
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month!=5), points(Wind, Ozone, col="red"))
legend("topright", pch=1, col=c("blue", "red"), legend=c("May", "Others"))

airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone(ppb)")

with(airquality,plot(Wind, Ozone, main="Ozone and Wind in New York City", pch=20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2)

par(mfrow=c(1,2))
with(airquality,{
        plot(Wind, Ozone, main="Ozone and Wind")
        plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
})


par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality,{
        plot(Wind, Ozone, main="Ozone and Wind")
        plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
        plot(Temp, Ozone, main="Ozone and Temperature")
        mtext("Ozone and Weather in New York City", outer=TRUE)
})


x <- rnorm(100)
hist(x)


######################

x <- rnorm(100)
y <- rnorm(100)
plot(x,y)

par(mar=c(2,2,2,2))
plot(x,y)

par(mar=c(4,4,2,2))
plot(x,y)
plot(x,y, pch=1)
plot(x,y, pch=2)
plot(x,y, pch=3)
plot(x,y, pch=4)
plot(x,y, pch=5)
plot(x,y, pch=6)
plot(x,y, pch=7)
plot(x,y, pch=8)
plot(x,y, pch=9)
plot(x,y, pch=10)
plot(x,y, pch=11)
plot(x,y, pch=12)
plot(x,y, pch=13)
plot(x,y, pch=14)
plot(x,y, pch=15)
plot(x,y, pch=16)
plot(x,y, pch=17)
plot(x,y, pch=18)
plot(x,y, pch=19)
plot(x,y, pch=20)
plot(x,y, pch=21, col="red", bg="yellow")
title("scatterplot")
text(-1,-2, "label")
legend("topleft", legend="data" )
fit <-lm(y ~x)
abline(fit)
abline(fit, lwd=3, col="blue")

x <- rnorm(100)
y <- x+rnorm(100)
plot(x,y,type="n")
g <- gl(2,50,labels=c("Male","Female"))
points(x[g=="Male"],y[g=="Male"],col="blue")
points(x[g=="Female"],y[g=="Female"],col="red")

## plot devices
library(datasets)
with(faithful,plot(eruptions, waiting))
title(main="title")

pdf("myplot.pdf")
with(faithful,plot(eruptions, waiting))
title(main="title")
dev.off()

with(faithful,plot(eruptions, waiting))
title(main="title")
dev.copy(png,file="myplot.png")
dev.off()


## project
temp <- tempfile()
options(HTTPUserAgent='R http client')
download.file("https://d396qusza40orc.cloudfront.net/exdata_data_household_power_consumption.zip",temp)
df <- read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep = ";",stringsAsFactors = FALSE)

my_df <- df[as.Date(df$Date,format="%d/%m/%Y")>=as.Date("01/02/2007",format="%d/%m/%Y") & as.Date(df$Date,format="%d/%m/%Y")<=as.Date("02/02/2007",format="%d/%m/%Y"),]
my_df$datetime <- strptime(paste(my_df$Date,my_df$Time), "%d/%m/%Y %H:%M:%S")
my_df$Global_active_power <- as.numeric(my_df$Global_active_power)
my_df$Global_reactive_power <- as.numeric(my_df$Global_reactive_power)
my_df$Voltage <- as.numeric(my_df$Voltage)
my_df$Sub_metering_1 <- as.numeric(my_df$Sub_metering_1)
my_df$Sub_metering_2 <- as.numeric(my_df$Sub_metering_2)
my_df$Sub_metering_3 <- as.numeric(my_df$Sub_metering_3)
## plot1
hist(my_df$Global_active_power,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")

## plot2
with(my_df,plot(datetime,Global_active_power,ylab="Global Active Power (kilowatts)", type="l"))

## plot3
with(my_df,plot(datetime,Sub_metering_1,ylab="Energy sub metering", type="l"))
with(my_df,lines(datetime,Sub_metering_2, col="red"))
with(my_df,lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot4
par(mfrow=c(2,2))

with(my_df,plot(datetime,Global_active_power,ylab="Global Active Power", type="l"))

with(my_df,plot(datetime,Voltage,ylab="Voltage", type="l",xlab="datetime"))

with(my_df,plot(datetime,Sub_metering_1,ylab="Energy sub metering", type="l"))
with(my_df,lines(datetime,Sub_metering_2, col="red"))
with(my_df,lines(datetime,Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(my_df,plot(datetime,Global_reactive_power,ylab="Global_reactive_power", type="l",xlab="datetime"))
