import urllib2,json,time
import MySQLdb as db
con=db.connect("IP Address",'Username','password','Database name')
cur=con.cursor()
READ_API_KEY='Read key'
CHANNEL_ID="Channel Id"

while True:

 def main():
    
    conn = urllib2.urlopen("http://api.thingspeak.com/channels/%s/feeds/last.json?api_key=%s" \
                           % (CHANNEL_ID,READ_API_KEY)) ## Connection with the URL

    response = conn.read()
    
    data=json.loads(response)
    if(data['field1']==None):
     pass
    else:
     northtemp=data['field1']
     northtemp=float(northtemp)
     northhum=data['field2']              ## This code collects the data from the cloud and inserts into MySQL database. This repeats every 16 seconds. So the data will be the recent data points inserted into the cloud by the script cloud_insert.py 
     northhum=float(northhum)
     southtemp=data['field3']
     southtemp=float(southtemp)
     southhum=data['field4']
     southhum=float(southhum)
     easttemp=data['field5']
     easttemp=float(easttemp)
     easthum=data['field6']
     easthum=float(easthum)
     westtemp=data['field7']
     westtemp=float(westtemp)
     westhum=data['field8']
     westhum=float(westhum)
     a=data['created_at']
     q='insert into table values("%s","%s","%s","%s","%s","%s","%s","%s","%s");'%(a,northtemp,northhum,southtemp,southhum,easttemp,easthum,westtemp,westhum)
     cur.execute(q)
     con.commit()
    
    
    
    
    
#conn.close()
 time.sleep(16)
 if __name__ == '__main__':
   
   main()
