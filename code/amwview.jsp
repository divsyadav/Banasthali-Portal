<%-- 
    Document   : amwview
    Created on : Mar 31, 2019, 5:00:00 PM
    Author     : welcome
--%>

<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Workshops</title>
    </head>
    <body background="picture/white-texture-backgrounds.jpg">        
    </body>
    <form action="amwview.jsp" method="POST">
    <p align="right">
                <input  type="submit" value="DELETE" name="view" />
                 <input  type="submit" value="ADD WORKSHOP" name="btn_update" />
               
            </p>
        
                <%
                    
                    if (request.getParameter("view")!= null)
                { 
                    response.sendRedirect("delete.jsp");
                    
                }
                 else if (request.getParameter("btn_update")!= null)
                { 
                    response.sendRedirect("Updateaayamworkshop.jsp");
                    
                }   
                   
     try
       {    
           Class.forName("org.apache.derby.jdbc.ClientDriver");
               Connection conn=null;
               Statement st=null;
               ResultSet rs=null;
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Banasthali Club Management System","project","project");
                st=conn.createStatement();
                rs=st.executeQuery("Select * from aayamworkshop where club='AAYAM' and catg='WORKSHOP'");
                while(rs.next())
                {
                    %>
                    
                     <table border="0" cellspacing="6" cellpadding="4">	
                     
                         <tbody>
					<tr>                         
					 <td rowspan="7" style="width: 98px">
                     <img src="picture/<%=rs.getString(8) %>" width="200" height="226"/>
                          </td>
                              			<tr>  
							<td>ID</td>
							<td><%=rs.getString(1) %></td>
                                                        
					   </tr>				
							
						<tr>  
							<td>Name</td>
							<td><%=rs.getString(2) %></td>
                                                        
					   </tr>
					   
					   <tr>
							<td>Description</td>
							<td><%=rs.getString(3) %></td>
					   </tr>
					   
					   <tr>
							<td>date</td>
							<td><%=rs.getString(4) %></td>
					  </tr>
					  
					 <tr>
							<td>Time</td>
							<td><%=rs.getString(5) %></td>
					</tr>
					
					<tr>
					       <td>venue</td>
					       <td><%=rs.getString(6) %></td>
					</tr>
							
					<tr>
					      <td>Open for</td>
					      <td><%=rs.getString(7) %></td>
					</tr>
							                  </tbody>
							                  </table>
                      
							                    <% 
                }
                
               %>
               
        
               <%
       }
     catch(Exception e)
    {
        e.getMessage();
    }
             
 
%>
</table>



</form>
</html>
