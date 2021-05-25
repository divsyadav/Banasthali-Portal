<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
       try
       {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
               Connection conn=null;
               Statement st=null;
               ResultSet rs1=null;
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Project","project","project");
                st=conn.createStatement();
              
                String ui=request.getParameter("UID");
                String tu=request.getParameter("textuname");
               String em=request.getParameter("email");
                String tp=request.getParameter("textupass");
                String de=request.getParameter("department");
                String ds=request.getParameter("designation");
             if (request.getParameter("btn_login") != null)
            {
                
               rs1 = st.executeQuery("select * from signin where uid='" + ui + "', password='" + tp + "',name='" + tu + "',email='" + em + "',department='" + de + "',designation='" + ds + "'");
             if(rs1.next())
               {
                      
                               //out.println(rs2.getString(1));
                        String ch=rs1.getString("designation");

        
                         if(ch=="student")
                         {

                            response.sendRedirect("AdminPanelAayam.jsp");
                         }
                         else if(ch=="hod")
                         {
                             response.sendRedirect("AdminPanelCorona.jsp");
                         }
                         else if(ch=="warden")
                         {
                             response.sendRedirect("AdminPanelSamarthya.jsp");
                         }
                          else if(ch=="admin")
                         {
                             response.sendRedirect("AdminPanelSamarthya.jsp");
                         }
               }
                  else
                {
                  
                                    %>
                                  <div class="alert">
                                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                                    Wrong id/password.
                                  </div>
                                       <%
    
                }
              }
              
     }
     catch(Exception e)
    {
        e.getMessage();
    }
     
%>
<html>
<head>
	<title>Login/Register</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="login.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
</head>
<body>
  
  <div class="cont">
    <div class="form sign-in">
      <h2>Sign In</h2>
      <form name="sigin" method="post" action="NewServlet">
          <label>
        <span>UID</span>
        <input type="text" name="UID" required>
      </label>
          <label>
        <span>Name</span>
        <input type="text" name="txtuname" required>
      </label>
      <label>
        <span>Email Address</span>
        <input type="email" name="email" required>
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="txtupass" required>
      </label>
      <label>
        <span>Designation</span>
        <input type="text" name="designation" required>
      </label>
      <label>
        <span>Department</span>
        <input type="text" name="department" required>
      </label>
      <input type="submit" value="LOG IN" name="submit"/>
      <!--<button class= "submit" type="button" >Sign In</button>-->
      </form>
      <p class="forgot-pass">Forgot Password ?</p>
     </div>

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Don't have an account? Sign up!</p>
        </div>
        <div class="img-text m-in">
          <h2>One of us?</h2>
          <p>If you already have an account, sign in.</p>
        </div>
        <div class="img-btn">
          <span class="m-up">Sign Up</span>
          <span class="m-in">Sign In</span>
        </div>
      </div>
      
      <div class="form sign-up">
         <form name="login" method="post" action="signin_servlet">
        <h2>Sign Up</h2>
          <label>
        <span>UID</span>
        <input type="text" name="UID" required>
        </label>
        <label>
          <span>Name</span>
          <input type="text" name="txtuname" required>
        </label>
        <label>
          <span>Email</span>
          <input type="email" name="email" required>
        </label>
        <label>
          <span>Password</span>
          <input type="password" name="txtupass" required>
        </label>
        <label>
          <span>Department</span>
          <input type="text" name="department" required>
        </label>
        <label>
          <span>Designation</span>
          <input type="text" name="designation" required>
        </label>
        <input type= "submit" value="SIGN UP" name="submit"/>
      <!-- <button type="button" class="submit">Sign Up</button>-->
      </form>
      </div>
          
    </div>
  </div>
<script type="text/javascript" src="login.js"></script>
  
</body>
</html>