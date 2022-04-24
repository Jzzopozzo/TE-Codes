import java.sql.*;
import java.io.*;
import java.util.*;

class Djdbc
{
	public static void main(String args[])
	{
		try
		{
		Connection c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","manager");
		System.out.println("Connection Established Successfully");
		Statement stmt=c1.createStatement();
		ResultSet r1=stmt.executeQuery("select s_id from students");

		while(r1.next())
		{
			System.out.println(r1.getInt(1));
		}
		Scanner s=new Scanner(System.in);
		System.out.print("Enter your id: ");
		int id= s.nextInt();

		System.out.println("Enter your name: ");
		String name = s.next();

		System.out.print("Enter your i_id: ");
		int i_id = s.nextInt();

		System.out.println("Enter your city: ");
		String city = s.next();

		String sql = "insert into students values (?, ?, ?, ?)";
		PreparedStatement mstmt=c1.prepareStatement(sql);

		// set param values
		mstmt.setInt(1, id);
		mstmt.setString(2, name);
		mstmt.setInt(3, i_id);
		mstmt.setString(4,city);

		// 3. Execute SQL query
		mstmt.executeUpdate();
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
unix@unix-HP-dx2480-MT-KL969AV:~/Desktop$ javac Djdbc.java
unix@unix-HP-dx2480-MT-KL969AV:~/Desktop$ java Djdbc
Fri Aug 18 14:16:16 IST 2017 WARN: Establishing SSL connection without server's identity verification is not recommended. According to MySQL 5.5.45+, 5.6.26+ and 5.7.6+ requirements SSL connection must be established by default if explicit option isn't set. For compliance with existing applications not using SSL the verifyServerCertificate property is set to 'false'. You need either to explicitly disable SSL by setting useSSL=false, or set useSSL=true and provide truststore for server certificate verification.
15
22
31
55
Enter your id: 15
Enter your name: 
Sima
Enter your i_id: 105
Enter your city: 
Pune
*/
