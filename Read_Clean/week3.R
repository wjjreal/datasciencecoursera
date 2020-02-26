



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
