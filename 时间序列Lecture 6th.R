#some features of R
A<-3
r<-rnorm(5)
#some examples of R for customer
ID<-c(1:6) #定义一个向量
sex<-c('m','f','m','m','f','f')
income<-c(1000,2000,3000,2500,1500,500)
age<-c('young','elder','young','elder','elder',NA)
m<-matrix(c(2,3,4,12,13,14),nrow=2,ncol=3,byrow=T)
customer<-data.frame(ID,sex,income,age)#可以构建数据啦！
logvector<-c(T,F,T,T,F,F)
income[3]
income[c(1,3)]
m[1,2]
m[c(1,2),2]
m[c(1,2),c(2,3)]
m[1,]
m[,2]
#apply functions on objects (data,functions,graph,analytical result,etc.)
yincome<-income^12
mincome<-mean(income)
#Basic functions are availabe by default.

#One can build functions himself.
a<-function(m){
  l<-length(m)
  s<-0
  for (i in i:1){
    s=s+m[1]
  }
  s/l
}
#Other functions are contained in packages.
install.packages('maxLik')
library(maxLik)
res<-maxLik(logLik())
#Workspace

#data types

#export data
write.table(customer,file.choose(),sep = '\t',row.names=F)
write.table(customer,file.choose(),sep = ',',row.names=F)
write.xlsx(customer,)

#import data
read.table('/Users/tangqihao/Desktop/123.txt',sep='\t',header=T)
read.table('/Users/tangqihao/Desktop/123.txt',sep='\t',header=T,skip=2)#当前几行是说明的时候

#work directory
getwd()
setwd('/Users/tangqihao/Desktop/') #改工作路径啦！
newdata1<-read.table('123.txt',sep='\t',header=T)
#rename the variable
fix(customer)
names(customer)[4]<-'testage'

#creating new variables
rm(income)
customer$yincome<-customer$income^12
attach(customer)
detach(customer)

#sort data
customer1<-customer[order(customer$income),]

#join to datasets

#select subset of the data

#date

#basic statistics










