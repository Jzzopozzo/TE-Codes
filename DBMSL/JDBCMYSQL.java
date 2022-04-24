//sudo apt-get install libmysql-java
//export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
import java.sql.*;
import java.sql.DriverManager;
import java.io.*;
import java.util.*;
 
class JDBCMYSQL 
{ 
 
    
    public static void main(String args[]) 
    {
        try 
        {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ass2","root", "manager");
            System.out.println("Success");
 			Statement stmt=con.createStatement();

			ResultSet rs=stmt.executeQuery("select * from student");


			while(rs.next())  
			{
				System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getInt(3));
			}

			con.close();

 
        }
         catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}
