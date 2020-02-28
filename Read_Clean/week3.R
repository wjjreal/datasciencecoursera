



set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]
X$var2[c(1,3)] = NA
X
##subsetting
X[,1]
X[,"var1"]
X[1:2,"var2"]
##logicals ands and ors
X[(X$var1 <= 3 & X$var3 > 11),]
X[(X$var1 <= 3 | X$var3 > 11),]
##Dealing with NA values
X[which(X$var2 > 8),]
##Sorting
sort(X$var1)
sort(X$var1, decreasing=TRUE)
sort(X$var2,na.last=TRUE)
##Ordering
X[order(X$var1),]
X[order(X$var1,X$var3),]
##ordering with plyr
library(plyr)
arrange(X,var1)
arrange(X,desc(var1))
##Adding rows and cols
X$var4 <- rnorm(5)
Y <- cbind(X,rnorm(5))



##Getting data from web
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")
head(restData,n=3)
tail(restData,n=3)
##summary
summary(restData)
##quantile
quantile(restData$councilDistrict,na.rm=T)
quantile(restData$councilDistrict,probs=c(0.5,0.75,0.9))
##table
table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict ,restData$zipCode)
##check for NA
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)
##Row and Col sum
colSums(is.na(restData))
all(colSums(is.na(restData))==0)
##Values with specific char
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),c(1,2)]
##Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt<-xtabs(Freq ~ Gender + Admit, data=DF)
xt
##Flat tables
warpbreaks$replicate <- rep(1:9,len=54)
xt = xtabs(breaks ~., data=warpbreaks)
ftable(xt)
##Size of data set
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="MB")

##use same restaurant data as above

##create sequence
s1 <- seq(1,10,by=2)
s2 <- seq(1,10,length=3)
x <- c(1,3,8,25,100)
seq(along =x)
##subsetting var
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

##Creating bin var
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)
##Creating category var
restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
##Easier cutting
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g=4)
table(restData$zipGroups)
##Creating factor var
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
##Levels of factor var
yesno <- sample(c("yes","no"), size=10, replace=TRUE)
yesnofac <- factor(yesno, levels=c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)
##Using mutate func
library(Hmisc)
library(plyr)
restData2 <- mutate(restData, zipGroups <- cut2(zipCode, g=4))
table(restData2$zipGroups)


##reshaping
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)
mData <- dcast(carMelt, cyl + gear ~ variable, mean)

##Averaging
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)
spIns <- split(InsectSprays$count,InsectSprays$spray)

sprCount <- lapply(spIns, sum)
unlist(sprCount)

sapply(spIns, sum)


ddply(InsectSprays, .(spray), summarize, sum=sum(count))

##create new var
spraySums <- ddply(InsectSprays, .(spray), summarize, sum=ave(count, FUN=sum))


##more func
##acast(...), arrange(...), mutate(...)


##dplyr
##designed to work with data frame
library(dplyr)
chicago <- readRDS("chicago.rds")
head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))

chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

chicago <- arrange(chicago, date)
chicago <- arrange(chicago, desc(date))

chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint=dptp)

chicago <- mutate(chicago, pm25detrend=pm25-mean(pm25, na.rm=TRUE))
head(select(chicago, pm25, pm25detrend))

chicago <- mutate(chicago, tempcat = factor(1*(tmpd>80), labels=c("cold","hot")))
hotcold <- group_by(chicago, tempcat)

summarize(hotcold, pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

chicago <- mutate(chicago, year=as.POSIXlt(date)$year+1900)
years <- group_by(chicago, year)
summarize(years, pm25=mean(pm25,na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

chicago %>% mutate(month=as.POSIXlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))


##merging data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile="./data/reviews.csv", method="curl")
download.file(fileUrl2, destfile="./data/solutions.csv", method="curl")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

mergeData <- merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)
head(mergeData)

##default merge all common column names
intersect(names(solutions), names(reviews))
mergeData2 <- merge(reviews, solutions, all=TRUE)
head(mergeData2)

##using join in plyr 
df1 <- data.frame(id=sample(1:10),x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id)
##join multiple data frame
df1 <- data.frame(id=sample(1:10),x=rnorm(10))
df2 <- data.frame(id=sample(1:10),y=rnorm(10))
df3 <- data.frame(id=sample(1:10),z=rnorm(10))
dfList <- list(df1,df2,df3)
join_all(dfList)

##image
imgUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
z <- tempfile()
download.file(imgUrl,z,mode="wb")
imgdf <- readJPEG(z,TRUE)
quantile(imgdf,probs=c(0,0.3,0.8,1))

##merge
grossdf <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip=4, stringsAsFactors=FALSE)
edudf <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", stringsAsFactors=FALSE)
mdf <- merge(grossdf, edudf, by.x="X", by.y="CountryCode", all=FALSE)
mdf <- mdf[!is.na(mdf$X.1),]
mdf_g <- group_by(mdf,Income.Group)
breaks <- quantile(mdf$X.1,na.rm=TRUE,probs=seq(0,1,0.2))
mdf$quantileGDPRank <- cut(mdf$X.1, breaks=breaks)
select(filter(mdf,Income.Group == "Lower middle income" & quantileGDPRank== "(1,38.6]"),X,quantileGDPRank)



