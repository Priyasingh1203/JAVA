<%@page import="java.sql.*" %>
<%
String uname = request.getParameter("uname");
String pass= request.getParameter("pass");
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Db","root","root");
Statement stmt= con.createStatement();
int i= stmt.executeUpdate("insert into login(uname,pass)values('"+uname+"','"+pass+"')");
if(i>0)
{
out.print("Login Successfully!!");
}
else
{
out.print("Login failed!! Please try again");
}
}
catch(Exception e)
{
System.out.println(e);
}
%>
