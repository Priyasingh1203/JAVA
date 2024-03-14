<%@page import="java.sql.*" %>
<%
String job = request.getParameter("job");
String fname = request.getParameter("fname");
String lname= request.getParameter("lname");
String mob = request.getParameter("mob");
String email= request.getParameter("email");

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Db","root","root");
Statement stmt= con.createStatement();
int i= stmt.executeUpdate("insert into carr(job,fname,lname,mob,email)values('"+job+"','"+fname+"','"+lname+"','"+mob+"','"+email+"')");
if(i>0)
{
out.print("Data inserted successfully!!");
}
else
{
out.print("Sorry!! Failed to insert the details");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>

