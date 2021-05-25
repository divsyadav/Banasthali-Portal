<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
       <title>Employee Entry Form</title>

</head>
    <body>
        <form name="f1">
            <input type="submit" name="btn_view " value="VIEW" >
          </form>
	
    </body>
</html>


<%
try{
 if(request.getParameter("btn_view")!=null)
    {
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/project","project","project");
    Statement stmt1=conn.createStatement();
    ResultSet rs=stmt1.executeQuery("select* from EVENTS where event_name='butterfly'");
       
        out.println("<html><body><form name=ff>");
       out.print("<table >");
        
	while(rs.next())
                  {
           out.print("<tr>");
            out.print("<td>"+rs.getString(1) +"</td>");
           out.print("<td>"+rs.getString(2) +"</td>");
          out.print("<td><img src="+rs.getBlob(3)+" width='102' height='76'/> </td>");
          out.print("<td>"+rs.getString(4) +"</td>");
            out.print("</tr>");
            }

        out.println("</form></body></html>");

    }
}
  catch(Exception ex){
          out.println(ex);
            }
%>     		 
            
    
