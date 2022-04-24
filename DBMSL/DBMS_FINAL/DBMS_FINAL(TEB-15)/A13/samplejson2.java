//Akshay S. Chavan					TEB-15



//Before running java program set the classpath for the program as below

//$ export CLASSPATH=$CLASSPATH:/home/akshay/Desktop/DBMS_FINAL/A13/json-simple-1.1.1.jar

//			ASSIGNMENT NO-13

//____________________________________________________________________________________


import java.io.FileReader;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class samplejson2{


public static void main(String[] args) {
JSONParser parser = new JSONParser();

try {

Object obj = parser.parse(new FileReader("/home/akshay/Desktop/DBMS_FINAL/A13/file.txt"));

JSONObject jsonObject = (JSONObject) obj;

String name = (String) jsonObject.get("Name");
String author = (String) jsonObject.get("Author");
JSONArray companyList = (JSONArray) jsonObject.get("Company List");

System.out.println("Name: " + name);
System.out.println("Author: " + author);
System.out.println("\nCompany List:");
Iterator<?> iterator = companyList.iterator();
while (iterator.hasNext()) {
System.out.println(iterator.next());
} }catch (Exception e) {

}
}
}
/*
file.txt Contents

{
"Name": "Dream of Mine",
"Author": "Akshay",
"Company List": [
"Compnay: Google",
"Compnay: IBM",
"Compnay: Microsoft"
]
}



Output:


akshay@akshay-1011PX:~/Desktop/DBMS FINAL/Assignment No-13$ javac samplejson2.java akshay@akshay-1011PX:~/Desktop/DBMS FINAL/Assignment No-13$ java samplejson2
Name: Dream of Mine
Author: Akshay

Company List:
Compnay: Google
Compnay: IBM
Compnay: Microsoft

*/
