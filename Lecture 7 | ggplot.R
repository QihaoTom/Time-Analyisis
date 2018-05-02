install.packages("dplyr")
install.packages("tidyr")
install.packages("maps")
install.packages("gapminder")
install.packages("ggplot")


#join two datasets
#first run
ID <- c(1,2,3,4,5,6)
sex <- c("m","f","m","m","f","f")
income <- c(1000,2000,3000,2500,1500,500)
age <- c("young","elder","young","elder","elder",NA)
customer <- data.frame(ID,sex,income)
customerage <- data.frame(ID,age)

#for convinience, I remove all the vectors
rm(ID,sex,income,age)

#join two datasets horizentally
#merge
?merge
merge(customer,customerage,by="ID")
cbind(customer,customerage)

#join two datasets vertically
new <- data.frame(ID=7,age="young")
rbind(customerage,new)

#dplyr is a package for data management
#it is strongly recommended
install.packages("dplyr")
library(dplyr)
full_join(customer,new,by="ID")

#select subset of the data
#if you want to select one column
#you can use
customer[,1]
#or
customer$ID
#or
customer["income"]

#if want to select column 1 to 2
customer[,c(1:2)]

#select subset with only sex and income
var <- c("sex","income")
customer[var]

#select subset without sex and income
customer[c(T,F,F,T)]
var <- names(customer) %in% c("sex","income")
customer[!var]

#if you want to select one row
customer[1,]
customer[which(customer$ID>3),]#returns all the observations with ID larger than 3

#one can also use subset()
#select ID=3, keep ID and sex
subset(customer,ID==3,select = c(ID,sex))

#change date to a number
x <- "2007-01-01"
x+1
y<- as.Date(x)
y+1
as.double(y)#returns the number of days from 1970-01-01
z <- "07-03-01"
as.Date(z)
w <- as.Date(z,"%y-%m-%d")
difftime(y,w,units="days")

#basic statistics
#mean(),sd(),median(),quantile(),range()
quantile(customer$income)

#control
#for interation
#for (var in seq) {statements}
z <- customer[which(customer$ID==0),]
for (i in 1:3){
  z[i,] <- customer[which(customer$ID==i),]
}

#while(cond) {statement}
z <- customer[which(customer$ID==0),]
i <- 1
while (i<=3){
  z[i,] <- customer[which(customer$ID==i),]
  i<- i+1
}

#if (cond) {statement}
#if (cond) {statement} else {statement}
z <- customer[which(customer$ID==0),]
for (i in 1:6){
  if (customer$ID[i] <= 3) {
    z[i,] <- customer[i,]
  }
}

for (i in 1:6){
  if (customer$income[i] <= 1000) customer$incat[i] <- "low" else customer$incat[i] <- "high"
}

#how to plot
#base plotting
#package: graphics
#plot/hist/boxplot/lines/points/text/title/axis
x <- rnorm(100,14,5) 
y <- x + rnorm(100,0,1) 
hist(x,xlab = "normal",ylab = "frequency")
boxplot(x)
mtcars
plot(mtcars$wt,mtcars$mpg)
title(main = "mpg vs wt")
#equivalent to 
plot(mtcars$wt,mtcars$mpg,main = "mpg vs wt")
plot(mtcars$wt,mtcars$mpg,main = "mpg vs wt",col="red")
with(mtcars,plot(wt,mpg))
#plot the points for cars with different colors
with(subset(mtcars,cyl==4),points(wt,mpg,col="blue"))
with(subset(mtcars,cyl==6),points(wt,mpg,col="red"))
with(subset(mtcars,cyl==8),points(wt,mpg,col="black"))
#write legend
legend("topright",pch=1,col = c("blue","red","black"),legend = c("4","6","8"))

library(ggplot2)
#lattice plotting
?xyplot
xyplot(mpg~wt,data = mtcars)
#how the cyl affects the mpg and wt?
xyplot(mpg~wt|cyl, data = mtcars, layout=c(3,1))

#ggplot2 plotting
qplot(wt,mpg,data=mtcars,color=cyl)
sample <- mtcars
#use factor
sample$cyl <- factor(sample$cyl)
qplot(wt,mpg,data=sample,color=cyl)
#why?
qplot(wt,mpg,data=sample,shape=cyl)
qplot(wt,mpg,data=sample,size=cyl,xlab = "mtcars_wt",ylab = "mtcars_mpg",main = "mpg~wt")
#ggplot
#wt is x, mpg is y, data is mtcars
ggplot(mtcars,aes(wt,mpg))
#must have other layers
ggplot(mtcars,aes(wt,mpg)) +
  geom_point(color="red")
  
ggplot(mtcars,aes(wt,mpg)) +
  geom_point(aes(color=factor(cyl)))

ggplot(mtcars,aes(wt,mpg)) +
  stat_smooth(method = "lm")

ggplot(mtcars,aes(wt,mpg)) +
  stat_smooth(method = "lm", aes(col=factor(cyl)),se=F)

ggplot(mtcars,aes(wt,mpg)) +
  geom_point(aes(col=factor(cyl)))+
  stat_smooth(method = "lm", se=F)

ggplot(mtcars,aes(wt,mpg,col=factor(cyl))) +
  geom_point()+
  stat_smooth(method = "lm", se=F,aes(group=1))+
  stat_smooth(method = "lm", se=F)





