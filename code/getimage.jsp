<%-- 
    Document   : admin_imageview
    Created on : 24 Apr, 2021, 3:42:48 PM
    Author     : Hp
--%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
    Blob image = null;
    Connection conn = null;
    byte[ ] imgData = null ;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Project","project","project");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select  image from events where club = 'aayam' ");
       
        while (rs.next()) {
        image = rs.getBlob(1);
        imgData = image.getBytes(1,(int)image.length());
       
        }
        
    // display the image
        response.setContentType("image/jpg");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } 
    catch (Exception e) {
    out.println("Unable To Display image");
    out.println("Image Display Error=" + e.getMessage());
    return;
} 

%>