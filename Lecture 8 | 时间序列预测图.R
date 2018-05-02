
#Box Jenkins Methodology

#import the data...production.xls
install.packages("xlsx")
install.packages("xlsxjars")
library(rJava)
library(xlsxjars)
library(xlsx)

sample <- read.xlsx(
  file.choose(),header = TRUE,1)

#transfer to time series
#加ts变为时间序列
production <- ts(sample$production)

train <- ts(production[1:190])

train <- ts(production[1:10],
            start=2,
             frequency=12)

train <- ts(production[1:48],start=c(2018,3),frequency=12)

#1 identification

#1.1 plot the time series

plot(sample$month,sample$production,type='o')

plot(sample$month,sample$production,type='o')

plot(sample$month[1:36],
     sample$production[1:36],
     type='l')

plot(train)

#1.2 plot the sample acf

acf.production <- acf(train,lag.max=13,type="correlation")

summary(acf.production)

#1.3 adf test : 说明是平稳的

install.packages("tseries")

library(tseries)
# AR1
adf.test(train,k=1,
          alternative='explosive')

#The general regression equation 
#which incorporates a constant and 
#a linear trend is used

adf <- adf.test(train,k=1)

install.packages("urca")

library(urca)

adf <- ur.df(train,type = "trend",lags=1)
summary(adf)

#1.4 Box-Ljung Test
# check white noise
Box.test(train,lag=6,type = "Box-Pierce")

Box.test(train,lag=6,
         type = "Ljung-Box")

btest<-Box.test(train,lag=6,
       type = "Ljung-Box")

#2 ARMA

#2.1 order

acf(train,lag.max = 13,type="correlation")

acf(train,lag.max = 13,type="partial")

pacf(train,lag.max = 13)

#max.p=3 max.q=1

#2.2 estimate parameters

library(tseries)

train.01 <- arma(train,order=c(3,1))

train.02<-arma(train,
               lag=list(ar=c(1,2,3),
                        ma=1))

train.03<-arima(train,
                order=c(3,0,1),
                method="ML")

summary(train.01)

train.01$coef

library(forecast)

#auto.arima

#3 diagnostic checking

#3.1 t test, assignment

#3.2 Residual Analysis

ts.residuals <- residuals(train.01)

plot(ts.residuals)
# 看残差是不是白噪声
Box.test(ts.residuals,lag=8,type="Box")

#3.3 AIC

#how to select the best model according to AIC

#diagonostic checking is used to show how the model performs on the training data

#4 forecast the testing data, assignment, forecast

arima.sample <- Arima(train,order=c(1,0,0),method="CSS")

forecast.sample <- forecast(arima.sample,h=11)

plot(forecast.sample)

test<-ts(sample$production[191:201],
         start=191)
lines(test,col="red")


# if can not use Arima, then write forecast method by yourself


#5 validate the model

#calculate the MAPE



