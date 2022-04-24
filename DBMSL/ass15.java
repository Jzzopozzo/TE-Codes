//sudo apt-get install libmysql-java
//export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar


import java.sql.*;
import java.sql.DriverManager;
import java.io.*;
import java.util.*;

class ass15
{
	public static void main(String args[]) 
	{
        	try 
        	{
        	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Record", "pradnya", "pradnya12");
		
 		System.out.println("Success....");
 		int ch;
 		do
 		{
 			System.out.println("*************");
 			System.out.println("1.Insert");
			System.out.println("2.Display");
			System.out.println("3.Insert");
			System.out.println("4.Display");
			System.out.println("5.Display student and their department ");
			System.out.println("6.Exit");
			System.out.println("*************");
			System.out.println("\n Enter your choice: ");
		
			Scanner s=new Scanner(System.in);
			ch=s.nextInt();
			if(ch==1)
			{
				System.out.println("\n Enter Roll:");
				int Roll=s.nextInt();
					     
				System.out.println("\nEnter Name:");
				String Name=s.next();
					     
				System.out.println("\nEnter Dept_id:");
				String Deptid=s.next();
			          
			        String  sql="insert into Student values(?,?,?)";
			        PreparedStatement pstmt=con.prepareStatement(sql);
			      	
				pstmt.setInt(1,Roll);
				pstmt.setString(2,Name);
				pstmt.setString(3,Deptid);
				pstmt.executeUpdate();
				//break;
			}
		
			if(ch==2)
			{
				Statement stmt = con.createStatement();
			          
			       	ResultSet rs= stmt.executeQuery("select * from Student");
			          
			        System.out.println("Roll"+" "+"Name"+"   "+"Dept_id");
		          	System.out.println("-----------------------------------");
		          	while(rs.next())
		          	System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"   "+rs.getInt(3));
		          	//break;
			}
			
		
			if(ch==3)
			{
				System.out.println("\n Enter Dept_id:");
				int Deptid=s.nextInt();
					     
				System.out.println("\n Enter Dept_Name:");
				String DName=s.next();
			          
			        String  sql="insert into Dept values(?,?)";
			        PreparedStatement pstmt=con.prepareStatement(sql);
			        
			        pstmt.setInt(1,Deptid);  	
				pstmt.setString(2,DName);
				pstmt.executeUpdate();
			
			}	
	
			if(ch==4)
			{
				Statement stmt = con.createStatement();
			          
			       	ResultSet rs= stmt.executeQuery("select * from Dept");
		          
			        System.out.println("Dept_id" + "  "+"Dept_name");
		          	System.out.println("-----------------------------------");
		          	while(rs.next())
		          	System.out.println(rs.getInt(1)+"  "+rs.getString(2));
			}
			if(ch==5)
			{
				Statement stmt = con.createStatement();
		          
			       	ResultSet rs= stmt.executeQuery("select Name,Dname from Dept,Student where Student.Deptid=Dept.Dept_id and Dname='computer'");
			        System.out.println("NAME" + "  "+"Dept_name");
		          	System.out.println("-----------------------------------");
		          	while(rs.next())
		          	System.out.println(rs.getString(1)+"  "+rs.getString(2));
			}	 
		}while(ch<=6);
	 con.close();
	 }
	catch(Exception e)
        {
           	System.out.println(e);
        }
	}
	
}



/*
OUTPUT:

unix@unix-HP-dx2280-MT-RA529AV:~$ export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
unix@unix-HP-dx2280-MT-RA529AV:~$ javac ass15.java
unix@unix-HP-dx2280-MT-RA529AV:~$ java ass15


Mon Aug 28 12:54:51 IST 2017 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
Success....
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
1

Enter Name:
pradnya

Enter Dept_id:
101
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
2

Enter Name:
pradnya

Enter Dept_id:
101
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
3

Enter Name:
anshul

Enter Dept_id:
101
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
4

Enter Name:
preet

Enter Dept_id:
102
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
5

Enter Name:
shraddha

Enter Dept_id:
102
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
1

 Enter Roll:
6

Enter Name:
sahil

Enter Dept_id:
103
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
2
Roll Name   Dept_id
-----------------------------------
1  pradnya   101
2  pradnya   101
3  anshul   101
4  preet   102
5  shraddha   102
6  sahil   103
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************
*************

 Enter your choice: 
2
Roll Name   Dept_id
-----------------------------------
1  pradnya   101
2  pradnya   101
3  anshul   101
4  preet   102
5  shraddha   102
6  sahil   103
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
3

 Enter Dept_id:
101

 Enter Dept_Name:
computer
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
3

 Enter Dept_id:
102

 Enter Dept_Name:
mechanical
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
3

 Enter Dept_id:
103

 Enter Dept_Name:
IT
*************
1.Insert
2.Display
3.Insert
4.Display
5.Display student and their department 
6.Exit
*************

 Enter your choice: 
4
Dept_id  Dept_name
-----------------------------------
101  computer
102  mechanical
103  IT




*/
