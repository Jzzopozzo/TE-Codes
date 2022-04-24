
import pymongo
#from pymongo import MongoClient
client=pymongo.MongoClient("localhost",27017)
db=client.teb02
i=-1
n=-1
while(n<6):
 def zero():
  name=raw_input('Enter the name: ')
  roll=input('Enter the roll number: ')
  m=input('Enter the marks: ')
  db.Student.insert({'Rollno':roll,'Name':name,'Marks':m})
  print 'inserted'
 def one():
  name=raw_input('Enter the name: ')
  roll=input('Enter the roll number: ')
  m=input('Enter the marks: ')
  db.Student.remove({'Rollno':roll,'Name':name,'Marks':m})
  print 'Document removed'
 def four():
   print "\n1.Update roll no."
   print "\n2.Update name"
   print "\n3.Update marks"
   i=input("Enter your choice")	
   if(i==1):
	name1=raw_input("\n Enter the name whose roll no. is to be updated: ")		
	rno1=input("\n Enter the roll no. : ")
	db.Student.update({'Name':name1},{'$set':{'Rollno':rno1}})	
	print "\n Updated Successfully !!"
   elif(i==2):
        rno2=input("\n Enter the roll no. whose name is to be updated:  ")
	name2=raw_input("\n Enter the name")		
	db.Student.update({'Rollno':rno2},{'$set':{'Name':name2}})	
	print "\n Updated Successfully !!"
   elif(i==3):
	rno=input("\n Enter the roll no. whose marks is to be updated:  ")
	mk=input("\nEnter the new marks: ")
	db.Student.update({'Rollno':rno},{'$set':{'Marks':mk}})	
	print "\n Updated Successfully !!"
  
 def two():
  for item in db.Student.find():
   print item
 def three():
  exit()
 option={1: zero,
	 2: one,
	 3: two,
	 4: four,
	 5: three,
 }
 print 'MENU'
 print '1.Insert   2.Delete	3.Display	4.Update	5.Exit'
 n=input('Enter your choice: ')
 option[n]()
 
'''
OUTPUT:
unix@unix-HP-dx2480-MT-KL969AV:~/TEB02$ python assn6.py
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 1
Enter the name: Gayatri
Enter the roll number: 15
Enter the marks: 89
inserted
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 3
{u'_id': ObjectId('53df1dfed86b220cf8d0b10a'), u'Name': u'Gayatri', u'Rollno': 15, u'Marks': 89}
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 1
Enter the name: Aaron
Enter the roll number: 1
Enter the marks: 75
inserted
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 3
{u'_id': ObjectId('53df1dfed86b220cf8d0b10a'), u'Name': u'Gayatri', u'Rollno': 15, u'Marks': 89}
{u'_id': ObjectId('53df1e43d86b220cf8d0b10b'), u'Name': u'Aaron', u'Rollno': 1, u'Marks': 75}
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 1
Enter the name: Shonali
Enter the roll number: 57
Enter the marks: 91
inserted
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 3
{u'_id': ObjectId('53df1dfed86b220cf8d0b10a'), u'Name': u'Gayatri', u'Rollno': 15, u'Marks': 89}
{u'_id': ObjectId('53df1e43d86b220cf8d0b10b'), u'Name': u'Aaron', u'Rollno': 1, u'Marks': 75}
{u'_id': ObjectId('53df1e54d86b220cf8d0b10c'), u'Name': u'Shonali', u'Rollno': 57, u'Marks': 91}
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 2
Enter the name: Aaron
Enter the roll number: 1
Enter the marks: 75
Document removed
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 3
{u'_id': ObjectId('53df1dfed86b220cf8d0b10a'), u'Name': u'Gayatri', u'Rollno': 15, u'Marks': 89}
{u'_id': ObjectId('53df1e54d86b220cf8d0b10c'), u'Name': u'Shonali', u'Rollno': 57, u'Marks': 91}
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 4

1.Update roll no.

2.Update name

3.Update marks
Enter your choice1

 Enter the name whose roll no. is to be updated: Shonali

 Enter the roll no. : 59

 Updated Successfully !!
MENU
1.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 3
{u'_id': ObjectId('53df1dfed86b220cf8d0b10a'), u'Name': u'Gayatri', u'Rollno': 15, u'Marks': 89}
{u'_id': ObjectId('53df1e54d86b220cf8d0b10c'), u'Name': u'Shonali', u'Rollno': 59, u'Marks': 91}
MENU
.Insert   2.Delete	3.Display	4.Update	5.Exit
Enter your choice: 5
unix@unix-HP-dx2480-MT-KL969AV:~/TEB02$ 
'''
