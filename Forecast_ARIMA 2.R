data=read.csv(file.choose())
#data1=data.frame()
data[2,1]
l1<-list()
col<-colnames(data)
j=1

while(j<=115){
  k=2
  while(k<=13){
    l1=append(l1,paste(data[j,1],"-",col[k]))
    k=k+1
  }
  j=j+1
}

length(l1)
l1<-transpose(l1)
length(l1)
library(data.table)

data1=list()


i=1


while(i<=115)
{
  data1=append(data1,list(data[i,2:13]))
  i=i+1
}


d=data.frame(data1)

d=transpose(d)

data2=data.frame(d)

data3<-data.frame(l1,data2)

data4 = ts(data3[,2],start = c(1901,1),frequency = 12)

plot(data4, xlab='Years', ylab = 'Temp')

require(forecast)
ARIMAfit = auto.arima(data4, approximation=FALSE,trace=FALSE)
summary(ARIMAfit)

par(mfrow = c(1,1))
pred = predict(ARIMAfit, n.ahead = 36,se.fit=TRUE)
pred
plot(data4,type='l',xlim=c(1901,2018),ylim=c(10,30),xlab = 'Year',ylab = 'Weather Temp')
lines(10^(pred$pred),col='blue')
lines(10^(pred$pred+2*pred$se),col='orange')
lines(10^(pred$pred-2*pred$se),col='orange')

####using forecast####
fr <- forecast(object = data4, h= 120)
plot(fr)

