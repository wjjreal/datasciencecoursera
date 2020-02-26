if(!file.exists("data")){dir.create("data")}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/camera.xlsx",method="curl")
dateDownloaded<-date()

library(xlsx)
cameraData<-read.xlsx("./data/camera.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)


library(XML)
library(RCurl)
fileUrl<-"https://www.w3schools.com/xml/simple.xml"
xData<-getURL(fileUrl)
doc<-xmlTreeParse(xData,useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)

library(jsonlite)
jsonData<-fromJSON("https://api.github.com/users/jtleek/repos")


