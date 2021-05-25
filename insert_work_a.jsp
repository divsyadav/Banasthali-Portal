<%-- 
    Document   : admin_imageuo_work
    Created on : 25 Apr, 2021, 10:00:23 PM
    Author     : Hp
--%>

<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/3e6efceb06.js" crossorigin="anonymous"></script>
                 
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Workshops</title>
    </head>
    <body>
        <style>
body{
     background-size: 100%;
     background-image:  url(https://image.freepik.com/free-photo/light-green-abstract-background-with-imitation-texture-old-wall-spring-concept-background_139280-129.jpg);    
            }
*[role="form"] {
    max-width: 600px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color: #f2f2f2;
}
*[role="form"] h2 { 
    font-family: "Times New Roman", Times, serif;
    font-size: 40px;
    font-weight: 600;
    color: #000000;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}
.container{
    padding-top:100px;
    padding-bottom: 50px;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color: black;  /*rgb(242, 213, 131)*/
  color: white;
  text-align: center;
}
li {
    font-family: "Georgia", "Courier New", monospace;
    float: right;
    display: inline-block;
    padding-top:20px;
    padding-bottom: 10px;
}
li a {
  display: inline-block;
  color: white;
  text-align: right;
  padding: 14px 16px;
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
  background-color: #333;
}
.regimg{
    padding-top: 15px;
    padding-bottom: 0;
}
.navbar-brand{
    padding-top: 10px;
    padding-left: 20px;
}
.form-control{
    padding-left: 50px;
}
select {
        width: 50px;
        margin: 5px;
    }
     </style>
     <ul>
 <nav >
 <a class="navbar-brand" href="#">
    <img src="images/logo.jpg" width="80" height="80" alt=""/>
    </a>      
        <li style="width: 120px"><a href="LoginPage.jsp"><font size="4" color="white">Logout</font></a></li>
         <li style="width: 110px" ><a href="AdminPanelAayam.jsp"><font size="4" color="white">Home</font></a></li>
         <li style="width: 900px;"><a href="HomepageHome.jsp"><font size="6" color="white">Student Associations and Clubs</font></a></li>
</nav> 
</ul>

<div class="container">
            <form  method="post" action="insert_work_a.jsp"  class="form-horizontal" role="form">
                <h2>Insert Workshops</h2>
                <div class="form-group">
                    <label for="workby" class="col-sm-3 control-label">Workshop Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="ename" name="wname"  class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="workby" class="col-sm-3 control-label">Workshop Date</label>
                    <div class="col-sm-9">
                        <input type="text" id="evedate" name="wdate"  class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="workby" class="col-sm-3 control-label">Club Name</label>
                    <div class="col-sm-9">
                        <input type="text" id="cname" name="cname"  class="form-control" autofocus>
                    </div>
                </div>
                <div class="form-group">
                    <label for="workby" class="col-sm-3 control-label">Upload Image</label>
                    <div class="col-sm-9">
                        <input type="file" name="myimg" class="form-control" autofocus>
                        
                    </div>
                </div>
        <p align="center">
                <input  type="Submit" value="Upload" name="btn_up" />
                
                <!-------------->
                
               
        </form>
    </body>
</html>
<%
    try
       {  
           Connection conn=null;
           PreparedStatement pstmt = null;
           FileInputStream fis=null;
           String workname=request.getParameter("wname");
           String date=request.getParameter("wdate");
           String club=request.getParameter("cname");
           String myloc=request.getParameter("myimg");
           Class.forName("org.apache.derby.jdbc.ClientDriver");
           conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Project","project","project");
           File image= new File(myloc);
                    if (request.getParameter("btn_up")!= null)
                     {
                        
                            pstmt = conn.prepareStatement("insert into workshops(work_name, work_date,image,club) " + "values(?,?,?,?)");
                            pstmt.setString(1, workname);
                            pstmt.setString(2, date);
                            pstmt.setString(4, club);
                            fis=new FileInputStream(image);
                            pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
                            int count = pstmt.executeUpdate();
                            if(count>0)
                            {
                                
                               %>
                                      <script>
                                         swal("Done", "Inserted Successfully!!", "success");
                                      </script>
                                <%
                            }
                            else
                            {
                                 %>
                                  <script>
                                         
                                          swal("Error", "Data is not updated", "info");
                                        </script>
                                    <%
                            }
                        }
  
                    }
                     
   
            catch(Exception e)
            {
                System.out.print(e);
                e.printStackTrace();
       
            }
%>
