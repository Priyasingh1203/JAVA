<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");; %>
<HTML>
       <HEAD>
       <TITLE>The View Of Database Table </TITLE>
       </HEAD>
       <BODY BGCOLOR="cyan">
       <H1>The View Of Database Table </H1>
       <%
           Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/Db", "root", "root");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from registerdg") ;
       %>
      <TABLE BORDER="1">
      <TR>
      <TH>Name</TH>
      <TH>Email</TH>
      <TH>Mobile</TH>
      <TH>Username</TH>
      <TH>Password</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getString(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
      </TR>
      <% } %>
     </TABLE>
     </BODY>
</HTML>
