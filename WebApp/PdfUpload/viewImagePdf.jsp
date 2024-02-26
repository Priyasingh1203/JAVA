<%-- 
    Document   : viewImagePdf
    Created on : Feb 8, 2024, 2:19:36 PM
    Author     : SINGH'S FAMILY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Great!!</h1>
        <b>View | <a href="index.jsp">Upload</a></b><br/><br/>
        
		<%
		String id = request.getParameter("id");
		%>
		<img src="getImagePdf.jsp?id=<%=id%>" width="400px"/>
    </body>
</html>
