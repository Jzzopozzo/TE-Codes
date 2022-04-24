'''
Akshay S. Chavan						TEB-15
			ASSIGNEMENT NO-14
Create the following collection  in mongodb
     Student(rollno,name,address,contact_no,department)
     Write a menu driven program in python to connect with the database  and to perform the  following operation
1. Insert details of the student
2. Update the address of John to Dwarka
3. Display the students information
4. Delete a student’s record
___________________________________________________________________________________
'''
import pymongo
from pymongo import MongoClient

client = MongoClient()
db = client.teb57
choice = 1
while(choice > 0):   

    print("--------------------------:OPERATIONS:----------------------------")
    print("1.Insert\n2.Display\n3.Update\n4.Delete\n0.Exit")
    choice = int(input("Enter your choice: "))
    if (choice == 1):
        name = raw_input("Enter your name: ")
        rollno = input("Enter your roll no: ")
        dept = raw_input("Enter your department: ")        
        contact = input("Enter your contact no: ")
        address = raw_input("Enter your address: ")
        db.Student.insert({'Name':name, 'RollNo':rollno, 'Department':dept, 'Address':address, 'Contact':contact})

    elif (choice == 2):
        for item in db.Student.find():
            print(item)

    elif (choice == 3):
        rno = input("Enter roll no of the student")
        contact = input("Enter new contact no: ")
        address = input("Enter new address: ")
        db.Student.update({'RollNo':rno}, {"$set":{'Contact':contact, 'Address':address}})

    elif (choice == 4):
        rno = input("Enter roll no of the student: ")
        db.Student.remove({'RollNo':rno})
        
    elif (choice == 0):
        print("You are out of the program!")

    else:
        print("Invalid Choice !")



"""
___________________________________________________________________________________
Output:

akshay@akshay-1011PX:~/Desktop/DBMS FINAL$ python Assignment_No_14.py
--------------------------:OPERATIONS:----------------------------
1.Insert
2.Display
3.Update
4.Delete
0.Exit
Enter your choice: 1
Enter your name: Akshay
Enter your roll no: 15
Enter your department: Computer
Enter your contact no: 9822479700
Enter your address: Panchvati
--------------------------:OPERATIONS:----------------------------
1.Insert
2.Display
3.Update
4.Delete
0.Exit
Enter your choice: 2
{u'Name': u'Akshay', u'RollNo': 15, u'Contact': 9822479700L, u'Address': u'Panchvati', u'Department': u'Computer', u'_id': ObjectId('59e4b8fc4da404154949975e')}
--------------------------:OPERATIONS:----------------------------
1.Insert
2.Display
3.Update
4.Delete
0.Exit
Enter your choice: 0
You are out of the program!
"""
        
        
        
    
     
