
df <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
splitnames <- strsplit(names(df),"wgtp")
splitnames[123]

gdp <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", skip=4)
gdp_v <- as.numeric(gsub(",","",gdp$X.4))
gdp_v <- gdp_v[!is.na(gdp_v)]
gdp_v <- gdp_v[1:190]
mean(gdp_v)

gdp <- gdp[1:190,]

edu <- read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

mergeData <- merge(gdp, edu, by.x="X", by.y="CountryCode", all=FALSE)

notes <- as.character(mergeData$Special.Notes)
grep("[Ff]iscal year end.*[Jj]une", notes,value=TRUE)

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
class(sampleTimes[1])

y <- as.factor(year(sampleTimes))
summary(y)
w <- as.factor(weekdays(sampleTimes))
summary(w)

m_yw <- data.frame(y,w)
View(m_yw)
table(m_yw)


