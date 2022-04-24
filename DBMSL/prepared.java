//sudo apt-get install libmysql-java
//export CLASSPATH=$CLASSPATH:/usr/share/java/mysql-connector-java.jar
import java.sql.*;
import java.sql.DriverManager;
import java.io.*;
import java.util.*;
 
class prepared {
 
    
    public static void main(String args[]) {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://192.168.20.3:3306/db1", "root", "manager");
            System.out.println("Success");
 Statement stmt=con.createStatement();

ResultSet rs=stmt.executeQuery("select * from emp");

while(rs.next())
System.out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));
Scanner s = new Scanner(System.in);

System.out.print("Enter your eno: ");
String eno = s.next();

System.out.println("Enter your name: ");
String Name = s.next();

System.out.print("Enter your city: ");
String city = s.next();
String sql = "insert into emp values (?, ?, ?)";
PreparedStatement mstmt=con.prepareStatement(sql);

	// set param values
	mstmt.setString(1, eno);
	mstmt.setString(2, Name);
	mstmt.setString(3, city);

	// 3. Execute SQL query
	mstmt.executeUpdate();

con.close();

 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
