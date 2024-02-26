<%@page import = "java.sql.*"%>
<%
    String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
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
    int i = stmt.executeUpdate("insert into detail(name,mobile,email,username,password,dob,image,pdf)values('"+name+"','"+mobile+"','"+email+"','"+username+"','"+password+"','"+dob+"','"+image+"','"+pdf+"')");
    if(i>0)
    {
    System.out.println("Registered");
    }
    else{
    System.out.println("Not Registered");
        }
    }
    catch(Exception e)
    {
    System.out.println(e);
    }
%>
