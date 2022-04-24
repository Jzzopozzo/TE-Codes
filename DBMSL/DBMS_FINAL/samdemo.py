

import pymongo

client=pymongo.MongoClient("localhost",27017)
client.database_names()
db=client.mydb

db.Student.insert({'Rollno':01,'Name':"ABC",'Marks':50})
print 'inserted'
 
for item in db.Student.find():
  print item
 
 
 
 

