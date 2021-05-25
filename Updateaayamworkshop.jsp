<%--
    Document   : Updateaayamworkshop
    Created on : Mar 24, 2019, 6:20:56 PM
    Author     : welcome
--%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>update </title>
    </head>
    <body background="https://prmceam.ac.in/wp-content/uploads/2017/05/background-learner1.jpg">
        <form action="FileUploadServlet" method="POST" enctype="multipart/form-data">

        <h1 align="center">ADD WORKSHOP/EVENT</h1>

         <table align="center" border="0" cellspacing="6" cellpadding="4">

                <tbody>
                     <tr>
                        <td>Club Name</td>
                        <td><select name="clubname"  required>
                                <option>AAYAM</option>
                                </select></td>
                    </tr>
                     <tr>
                        <td>CATEGORY</td>
                        <td><select name="catg"  required>
                                <option>EVENT</option>
                                <option>WORKSHOP</option>
                                <option>SESSION</option>
                                </select></td>
                    </tr>
                    <tr>
                        <td>WORKSHOP/EVENT ID</td>
                        <td><input type="text" name="w_id" size="30" required/></td>
                    </tr>
                    <tr>
                        <td>WORKSHOP/EVENT NAME </td>
                        <td><input type="text" name="w_name" value="" size="30" required /></td>
                    </tr>
                    <tr>
                        <td>DESCRIPTION</td>
                        <td>
                            <textarea type="text" name="w_descp" size="30" required ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>DATE</td>
                        <td><input type="text" name="w_date" size="30" /></td>
                    </tr>
                    <tr>
                        <td>TIME</td>
                        <td><input type="text" name="w_time"  size="30" /></td>
                    </tr>
                    <tr>
                        <td>VENUE</td>
                        <td><input type="text" name="w_venue"  size="30" /></td>
                    </tr>
                     <tr>
                        <td>OPEN FOR</td>
                        <td><input type="text" name="w_openfor"  size="30" /></td>
                    </tr>
                     <tr>
                          <td>Upload your Poster </td>
                          <td> <input type="file" name="image" value="" width="20"/></td>
                    </tr>

                 </tbody>
            </table>
        <p align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input  type="reset" value="reset" name="btn_rest" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input   type="submit" value="Update" name="btn_update" />
            </p>
    </form>
    </body>
</html>



