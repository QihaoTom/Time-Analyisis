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
#要所有行，只要第一列
customer[,1][3]
#
customer[2,]
customer[c(F,T),]
customer$ID[3]
customer[c('ID','income')][2,1]
var<-c('ID','age','sex')
name<-names(customer)
customer[var]
customer[,c[1:2]]
#是否存在同样变量,取并集
a<-var %in% name
customer[var[a]]

var[a]
var[T.F.T]
var[c(T,F,T))]

name[a]
customer[name[!a]]

customer[,c[1,3]]
customer[which(customer$ID>3 & customer$sex=='m'),]
#date

#basic statistics
subset(customer,ID=3,select=c(ID,sex))

#change data to a number
x<-'2007-01-01'
#报错
x+1
#转化为日期处理
y<-as.Date(x)
y+1
as.double(y) #return the number of days from 1970-01-01
z<-"07-03-01"
as.Date(z)
w<-as.Date(z,"%y-%m-%d")
#从w到y有多少天
difftime(y,w,units="day")
quantile(customer$income)
#control
#for interation
#for (var in seq)  [statements]
z<-customer[which(customer$ID==0),]
for (i in 1:3){
  z[i,]<-customer[which(customer$ID==i),]
}

#while
z<-customer[which(customer$ID==0,)]
i<-1
while(i<-3){
  z[i,]<-customer[which(customer$ID==i),]
  i<-i+1
}

#大于赋值high，小于赋值low
for (i in 1:6){
  if (customer$income[i]<-1000)
    customer$incat[i]<-"low"
  else customer$incat[i]<-"high"
}

#how to plot 
x<-rnorm(100,14,5)
y<-x+rnorm(100,0,1)
hist(x,xlab="normal",ylab="frequency")
#箱线图
boxplot(x)
#自带车的数据
mtcars
#是个图层哦，所以可以往上���加即可，没跑一次，就是一个新图层
plot(mtcars$wt,mtcars$mpg)
title(main='mpg vs wt')
#equivalent to
plot(mtcars$wt,mtcars$mpg,main="mpg vs wt")
plot(mtcars$wt,mtcars$mpg,main="mpg vs wt",col="red")
#不用再detach
with(mtcars,plot(wt,mpg))
#
with(subset(mtcars.cyl=4),points(wt,mpg,col="blue"))
with(subset(mtcars.cyl=6),points(wt,mpg,col="red"))
with(subset(mtcars.cyl=8),points(wt,mpg,col="black"))

#
legend("topright",pch=1,col=c("blue","red","black")),legend=
