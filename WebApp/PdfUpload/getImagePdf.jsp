<%-- 
    Document   : getImagePdf
    Created on : Feb 8, 2024, 2:21:03 PM
    Author     : SINGH'S FAMILY
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    try {
        Connection con = db.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from doc where id=?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Blob blob = rs.getBlob("pdf");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("pdf/pdf");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        } else {
            System.out.println("No pdf found with this id.");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
