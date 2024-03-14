<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String message= request.getParameter("message");

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Db","root","root");
Statement stmt= con.createStatement();
int i= stmt.executeUpdate("insert into contact(name,email,message)values('"+name+"','"+email+"','"+message+"')");
if(i>0)
{
out.print("Thanks for contacting!!");
}
else
{
out.print("Sorry!! Try Again");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>


