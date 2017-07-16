import time
import httplib
import urllib 

from random import uniform
key = 'writekey' ## Thingspeak cloud platform is used to upload the data. This write key of the channel comes here.


while True:
        southtemp=uniform(27.1,30.7)
        northtemp=uniform(24.1,27.7)
        easttemp=uniform(25.1,28.7)
        westtemp=uniform(27.1,30.7)       ## This code is actually mimicing the work of the IoT sensors by sending random numers as data to the cloud.
        
        southhum=uniform(38.6,50.7)
        northhum=uniform(35.6,45.7)
        easthum=uniform(40.6,50.7)
        westhum=uniform(38.6,50.7)
        

        
        params = urllib.urlencode({'field1':northtemp,'field2':northhum,'field3':southtemp,'field4':southhum,'field5':easttemp,'field6':easthum,'field7':westtemp,'field8':westhum,'key':key })
        headers = {"Content-typZZe": "application/x-www-form-urlencoded","Accept": "text/plain"}
        conn = httplib. HTTPConnection("api.thingspeak.com:80")'
        conn.request("POST", "/update", params, headers)
        conn.close()
        time.sleep(16)  ## This means that the data will be inserted every 16 seconds.
