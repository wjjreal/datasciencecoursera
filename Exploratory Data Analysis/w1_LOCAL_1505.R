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















