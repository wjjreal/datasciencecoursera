
##Getting data from web
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile="./data/cameras.csv",method="curl")
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)

tolower(names(cameraData))
toupper(names(cameraData))

splitnames <- strsplit(names(cameraData),"\\.")
class(splitnames)
splitnames[6]

myList <- list(letters=c("A", "B", "C"), numbers=c(1:3), matrix(1:25, ncol=5))
myList[1]
myList[[1]]

#sapply
firstElement <- function(x){x[1]}
sapply(splitnames, firstElement)


##Peer review
#fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
#fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
#download.file(fileUrl1, destfile="./data/reviews.csv", method="curl")
#download.file(fileUrl2, destfile="./data/solutions.csv", method="curl")
#URL NA, download under data folder
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)
names(reviews)
sub("_","",names(reviews))


testname <- "a_b_c_d"
gsub("_","",testname)

grep("Alameda", cameraData$intersection)
cameraData[c(65,69,79),]

table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[grepl("Alameda", cameraData$intersection),]

grep("Alameda", cameraData$intersection,value=TRUE)

##
library(stringr)
nchar("hello world")
substr("hello world",1,4)
paste("hello", "world")
paste0("hello", "world")
##trim space begin and end
str_trim("   hello   ")

##date
d1 <- date()
class(d1)

d2 <- Sys.Date()
class(d2)

##Mar 1st, 2020
format(d2,"%d %a %A %m %b %B %y %Y")

x <- c("1jan1960", "2jan1960")
z <- as.Date(x,"%d%b%Y")
z[1] - z[2]
as.numeric((z[1] - z[2]))

weekdays(d2)
months(d2)
julian(d2)

library(lubridate)
ymd("20140108")
mdy("08042013")
ymd_hms("2011-08-03 10:11:12")
ymd_hms("2011-08-03 10:11:12", tz="Pacific/Auckland")
?Sys.timezone

wday(d1)
wday(d1,label=T)


Sys.getlocale("LC_TIME")
help(package = lubridate)

