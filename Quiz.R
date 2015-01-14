setwd("F:/study/YY/Dropbox/Course/JHU_Clean_Data")
data<-read.csv('getdata-data-ss06hid.csv')
#How many properties are worth $1,000,000 or more?
length(which(data$VAL==24)) #53

install.packages("xlsx")
library(xlsx)
dat <- read.xlsx(file="getdata-data-DATA.gov_NGAP.xlsx",sheetIndex=1,startcol=7, endCol=15, startRow=18, endRow=23, header=TRUE)
sum(dat$Zip*dat$Ext,na.rm=T) #0

install.packages("XML")
require(XML)
doc<-xmlTreeParse('getdata-data-restaurants.xml',useInternal=TRUE)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231]) #127

install.packages("data.table")
library(data.table)
DT<-fread('getdata-data-ss06pid.csv')
DT[,mean(pwgtp15),by=SEX]
