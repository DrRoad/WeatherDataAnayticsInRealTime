library(RMySQL)
con=dbConnect(MySQL(),user='username',password='password',dbname='dbasename',host='hostname')
result=dbSendQuery(con,"select * from table;")
data.frame=fetch(result)
df1=data.frame(data.frame)
class(data.frame)
library('ggplot2')
date=df1$date
date1=array(dim = length(date))
time1=array(dim = length(date))
i=1
while(i<=length(date))
{
  date1[i]=substr(date[i],0,10)
  time1[i]=substr(date[i],12,19)
  i=i+1
}
df1=df1[,c('northtemp','northhum')]
lm1=lm(df1$northtemp~.,df1)
#predict(lm1,40.5)
df2=data.frame(c(41.7546,38.5678))
df2=df1[1:3,]
df2['northtemp']=c(41.7546,38.5678,39.5678)
predict(lm1,df2['northhum'])