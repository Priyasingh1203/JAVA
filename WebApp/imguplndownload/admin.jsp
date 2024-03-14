<%@page import = "java.sql.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");   
    String image = request.getParameter("image");
  
    response.sendRedirect("retrieve.jsp");
    try
    {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
    Statement stmt=con.createStatement();
    int i = stmt.executeUpdate("insert into image(name,email,mobile,image)values('"+name+"','"+email+"','"+mobile+"','"+image+"')");
    if(i>0)
    {
    System.out.println("Data Inserted to Database");
    }
    else{
    System.out.println("Failed");
        }
    }
    catch(Exception e)
    {
    System.out.println(e);
    }
    %>




