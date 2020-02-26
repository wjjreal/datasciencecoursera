



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
