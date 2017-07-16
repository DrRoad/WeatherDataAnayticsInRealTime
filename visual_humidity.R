library(RMySQL)
con=dbConnect(MySQL(),user='username',password='password',dbname='dbasename',host='hostname')
result=dbSendQuery(con,"select * from table;")
data.frame=fetch(result)
data.frame
temp=data.frame$temp
hum=data.frame$humidity
pm=data.frame$pmlevel
date=data.frame$date
date1=array(dim = length(date))
time1=array(dim = length(date))
i=1
while(i<=length(date))
{
  date1[i]=substr(date[i],0,10)
  time1[i]=substr(date[i],12,19)
  i=i+1
}



library("ggplot2")
require(reshape2)
df<-melt(data.frame(time1,hum))
print(df)
ggplot(df,aes(time1,hum,group=1))+geom_line()
