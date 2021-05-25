<%-- 
    Document   : SignUp
    Created on : Mar 1, 2019, 11:01:02 PM
    Author     : Sanchi
--%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        
        <script>
        function validateForm()
        {   
              var x=document.forms["signup"]["txt_stdname"].value;         
            var z=document.forms["signup"]["txt_contact"].value;
           
        {
            if(!/^[A-Za-z]+$/.test(x))
            {
               alert("Please enter your name in valid characters");
                
            }
            if(!/^[0-9]+$/.test(z))
            {
                
                alert("Please enter valid 10 digit no.");
            }
            
            
            
        }
    }
        
        
        
</script>

    </head>

<%
     try
       {
           Class.forName("org.apache.derby.jdbc.ClientDriver");
               Connection conn=null;
               Statement st=null;
               conn=DriverManager.getConnection("jdbc:derby://localhost:1527/Banasthali Club Management System","project","project");
                st=conn.createStatement();
               
          
            
           
               if (request.getParameter("btn_reg")!= null)
                { 
                     String stdname=request.getParameter("txt_stdname");
             
             String stdid=request.getParameter("txt_stdid");
          
           String email=request.getParameter("txt_email");
        
            String c=request.getParameter("txt_contact");
            
            
            long contact=0;
          
            contact=Long.parseLong(c);
            
            //Integer contact=c.;
            
           //out.print(""+contact);
           
           String course=request.getParameter("txt_course");
           String year=request.getParameter("txt_year");
           String pwd=request.getParameter("txt_pwd");
               // ResultSet rs1=st.executeQuery("update login set username='"+username+"'and '"+pwd+"'");
               int y = st.executeUpdate("insert into student values('"+stdname+"','"+stdid+"','"+email+"',"+contact+",'"+course+"','"+year+"','"+pwd+"')");
              // (std_name,std_id,std_email,std_contact,std_course,std_yr,std_pwd)           
               
                            if(y>0)
                            {  
                                
                                
                               out.print("Registration successful");
                                
                                        
                                response.sendRedirect("Login.jsp");
                            }
                            else
                            {
                                out.print("error in inserting");
                            }
                }
              
               conn.close();
               
       }
            catch(Exception e)
            {
                System.out.print(e);
                e.printStackTrace();
                //e.getMessage();
            }
    
    %>

 

    <body background="picture/signup.jpg">
        <form name="signup" action="SignUp.jsp"   method="POST">


         
        <h1 align="center"><font size="8" color="white">Sign Up</font></h1>
        
         <table align="center" border="0" cellspacing="6" cellpadding="4">
               
                <tbody>
                    <tr>
                       <td><font size="5" color="white">Student Name</font>
                        <font color="red">*</font>
                       </td>
                       <td><input type="text" name="txt_stdname" size="30" /></td>
                    </tr>
                     <tr>
                       <td><font size="5" color="white">Student ID</font>
                        <font color="red">*</font></td></td>
                        <td><input type="text" name="txt_stdid" value="" size="30" required /></td>
                    </tr>
                    <tr>
                        <td><font size="5" color="white" >Password</font>
                            <font color="red">*</font></td>
                        <td><input type="password" name="txt_pwd" value="" size="30" maxlength= "10" required /></td>
                    </tr>
                      <tr>
                        <td><font size="5" color="white">Contact Number</font></td>
                        <td><input type="tel" name="txt_contact" value="" size="30" maxlength="10"   requiired /></td>
                    </tr>
                    <tr>
                     <td><font size="5" color="white">Email id</font>
                      <font color="red">*</font></td></td>
                     <td><input type="email" name="txt_email" value="" size="30" required />
                      <span class="note"><font color="White">Format: example@domain.com</font></span></td>
                    </tr>
                  
                    <tr>
                        <td><font size="5" color="white">Course</font></td>
                        <td><select name="txt_course">
                               <option>B.Tech (CS)</option>
                                 <option>B.Tech (IT)</option>
                                 <option>B.Tech (MT)</option>
                                 <option>B.Tech (EE)</option>
                                 <option>B.Tech (EI)</option>
                                 <option>B.Tech (EEE)</option> 
                                <option>B.sc</option>
                                <option>M.tech</option>
                                <option>M.sc</option>
                                <option>b.des</option>
                                <option>bba</option>
                                <option>b.com</option>
                                <option>mass.comm</option>
                                </select></td>
                    </tr>
                    <tr>
                        <td><font size="5" color="white">Year</font></td>
                        <td><select name="txt_year">
                                <option>1st</option>
                                <option>2nd</option>
                                <option>3rd</option>
                                <option>4th</option>
                                <option>5th</option>
                                </select></td>
                    </tr>
                    
                 </tbody>
            </table>
        <p align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input  type="reset" value="Reset" name="btn_cancel"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input   type="submit" value="Register" name="btn_reg" onclick="return validateForm()" />
            </p>
        </form>
    </body>
</html>
