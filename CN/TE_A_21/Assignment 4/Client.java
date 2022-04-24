/*
Problem Statement-Write a program using TCP socket for wired network for following
a. Say Hello to Each other ( For all students)
b. File transfer ( For all students)
c. Calculator (Arithmetic) (50% students)
d. Calculator (Trigonometry) (50% students)
Demonstrate the packets captured traces using Wireshark Packet Analyzer Tool for peer to
peer mode.


#Name:-Anuja Chandrashekhar Dixit.
#Class:-TE-A
#Roll. No:-21




*/

import java.net.*;
import java.io.*;  

public class Client
{
        public static void main(String args[])throws Exception
        {  
		Socket s=new Socket("192.168.22.95",3333);  
		DataInputStream din=new DataInputStream(s.getInputStream());  
		DataOutputStream dout=new DataOutputStream(s.getOutputStream());  
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));  
		  
		String str="",str2="";  
		while(!str.equals("stop"))
		{  
			str=br.readLine();  
			dout.writeUTF(str);  
			dout.flush();  
			str2=din.readUTF();  
			System.out.println("Server says: "+str2);  
		}  
	  
		dout.close();  
		s.close();  
	}
}
