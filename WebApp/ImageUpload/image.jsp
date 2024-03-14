<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String image= request.getParameter("image");

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
Statement stmt= con.createStatement();
int i= stmt.executeUpdate("insert into imagedb(name,email,image)values('"+name+"','"+email+"','"+image+"')");
if(i>0)
{
out.print("Image uploaded successfully!!");
}
else
{
out.print("Sorry!! Your data not saved");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>
