<%@page import = "java.sql.*"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String dob = request.getParameter("dob");
    String image = request.getParameter("image");
    String pdf = request.getParameter("pdf");
    
    try
    {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
    Statement stmt=con.createStatement();
    int i = stmt.executeUpdate("insert into form(name,email,mobile,username,password,dob,image,pdf)values('"+name+"','"+email+"','"+mobile+"','"+username+"','"+password+"','"+dob+"','"+image+"','"+pdf+"')");
    if(i>0)
    {
    out.println("Registered");
    }
    else{
    out.println("Not Registered");
        }
    }
    catch(Exception e)
    {
    System.out.println(e);
    }
    %>
