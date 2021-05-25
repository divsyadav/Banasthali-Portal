<%-- 
    Document   : viewiwreg
    Created on : Mar 31, 2019, 12:39:24 AM
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
        <title>view winners</title>
    </head>
    <body>        
    </body>
    <ul>
 <nav >
 <a class="navbar-brand" href="#">
   <img src="images/logo.jpg" width="60" height="60" alt=""/>
    </a>      
        <li style="width: 120px"><a href="LoginPage.jsp"><font size="4" color="white">Logout</font></a></li>
         <li style="width: 110px" ><a href="AdminPanelAayam.jsp"><font size="4" color="white">Home</font></a></li>
         <li style="width: 900px;"><a href="HomepageHome.jsp"><font size="6" color="white">Student Associations and Clubs</font></a></li>
</nav> 
</ul>
    <form action="newjsp1.jsp" method="POST">
        <table border="4" align="center" style="width:50%">
            <h2>Workshop Registered List</h2>
                
          
                <div class="form-group">
                    <label for="wokrName" class="col-sm-3 control-label"> Choose Workshop Name</label>
                    <div class="col-sm-9">
                        <select name="wname" class="form-control" autofocus required>
                            <%
                                 Connection conn1=null;
                                try
                                {   
                                    String query="select work_name from workshops where club='aayam' ";
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    conn1=DriverManager.getConnection("jdbc:derby://localhost:1527/Project","project","project");
                                    Statement st=conn1.createStatement();
                                    ResultSet rs=st.executeQuery(query);
                                    
                                    while(rs.next())
                                        {
                                                String wname = rs.getString("work_name"); 
                                            %>
                                            <option value="<%=wname %>"><%=wname %></option>
                                            <%
                                        }
                                        
                                }
                                catch(Exception e)
                                {
                                    System.out.print(e);
                                    e.printStackTrace();
                                } 
                             %>
                        </select>
                    </div>
                </div>
                
               
                
                        <div class="col-sm-12">
                       <div class="row">
                            <div class="col-sm-6">
                                <button type="submit" name="btnview" class="btn btn-primary btn-block">View</button>
                            </div>
                            
                        </div>
        </div>
                
                
            </form> <!-- /form -->
            
<tr>


<td bgcolor="#ccccff">Student name</td>
<td bgcolor="#ccccff">Email</td>
<td bgcolor="#ccccff">Course</td>
<td bgcolor="#ccccff">Current Year</td>
<td bgcolor="#ccccff">Phone number</td>



</tr>
        <%
     try
       {
           String w=request.getParameter("wname");
           Class.forName("org.apache.derby.jdbc.ClientDriver");
               Connection conn=null;
               Statement st=null;
               ResultSet rs=null;
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Project","project","project");
                st=conn.createStatement();
                rs=st.executeQuery("Select s_name,email,course,current_year,ph_number from workshop_reg Where workshop_name='" + w+ "'  ");
                if (request.getParameter("btnview")!= null)
                        {
                            while(rs.next())
                {
                    %>
                    <tr bgcolor="#ffffff">
                  
                     
                      <td><%=rs.getString(1) %></td>
                   <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                     <td><%=rs.getString(5) %></td>
                    
                     
                   </tr>
                   
                    <%
                }
                        }
                
                
               %>
        </table>
               <%
       }
     catch(Exception e)
    {
        e.getMessage();
    }
             
 
%>
 <div class="footer">
  <center>
          <p class="col-12 text-white text-center tm-copyright-text">
            Copyright &copy 2021 <a href="#" class="tm-copyright-link">Student Clubs And Associations - A Banasthali Portal
            Designed by Group CS08</a>
          </p>
        </center>
</div>
<style>
     body{
        background-image: url(https://image.shutterstock.com/image-photo/light-texture-design-ideas-white-260nw-1019979697.jpg);
        background-size:100%;
    }
    li {
    font-family: "Georgia", "Courier New", monospace;
    float: right;
    display: inline-block;
    padding-top:10px;
    padding-bottom: 10px;
    padding-left: 2px;
}
li a {
  display: inline-block;
  color: white;
  text-align: right;
 padding-left: 2px;
  padding: 2px 2px;
  text-decoration: crimson;
}
li a:hover {
    background-color: #ff6666;
}
.active {
  background-color: red;
  
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color:#8fd19e;
  height:50px;
}
.navbar-brand{
    padding-top: 0px;
    padding-left: 0px;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: black;  
  color: white;
  text-align: center;
}
    </style>
    
        
    </form>
</html>