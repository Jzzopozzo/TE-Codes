//sudo apt-get install libmysql-java
//export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
import java.sql.*;
import java.io.*;
import java.util.*;

class jdbc
{
	public static void main(String args[])
	{
		try
		{
			//Establishing connection between client(jdbc.java) and server(mysql)
			Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/a15", "root", "manager");
			System.out.println("Connection Established Successfully");
			//Statement class contains method for executing query
			Statement stmt=c1.createStatement();
			//set of rows obtained after executing query are of type ResultSet
			ResultSet r1=stmt.executeQuery("select * from employee");

			while(r1.next())
			{
				System.out.println(r1.getString(1)+" "+r1.getString(2)+" "+r1.getString(3)+" "+r1.getInt(4));
				
			}
			c1.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
/*
OUTPUT:
unix@unix-HP-dx2480-MT-KL969AV:~$ export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
unix@unix-HP-dx2480-MT-KL969AV:~$ javac jdbc.java
unix@unix-HP-dx2480-MT-KL969AV:~$ java jdbc
Fri Aug 18 13:39:16 IST 2017 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
roshani adgaon nashik 0
sadhna panchavati pune 0

*/
