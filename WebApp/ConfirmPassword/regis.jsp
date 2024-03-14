<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email= request.getParameter("email");
String uname = request.getParameter("uname");
String pass= request.getParameter("pass");
String cpass= request.getParameter("cpass");
String mob= request.getParameter("mob");
try
{
 if (pass.equals(cpass)) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Db", "root", "root");

        // Registration logic using PreparedStatement
        String sql = "INSERT INTO regis(name, email, uname, pass, cpass, mob) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, uname);
        pstmt.setString(4, pass);
        pstmt.setString(5, cpass);
        pstmt.setString(6, mob);

        int i = pstmt.executeUpdate();

        if (i > 0) {
            out.print("Registered");
        } else {
            out.print("Not Registered");
        }

        pstmt.close();
        con.close();
    } else {
        out.print("Passwords do not match");
    }
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>

