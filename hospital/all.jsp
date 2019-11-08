<%-- 
    Document   : search
    Created on : 8 Nov, 2019, 2:50:29 PM
    Author     : wad13
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        
        
        
        try{
            Class.forName("org.postgresql.Driver");
        }catch(ClassNotFoundException e){
            out.println(e.getMessage());
        }
        
        String url = "jdbc:postgresql://localhost:5432/hosp";
        String db_user = "postgres";
        String db_pass = "root";
        
        Connection conn = DriverManager.getConnection(url,db_user,db_pass);
        Statement smt = conn.createStatement();
        
        ResultSet rs = smt.executeQuery("Select * from pat");
        out.println("<html><table border=1><tr><th>MR</th><th>Name</th><th>Disease</th><th>BloodGroup</th></tr>");
        while(rs.next())
        {
            
                out.println("<tr><td>"+rs.getString("mr")+"</td>");
                out.println("<td>"+rs.getString("name")+"</td>");
                out.println("<td>"+rs.getString("ds")+"</td>");
                out.println("<td>"+rs.getString("bldgrp")+"</td></tr>");
                
            
        }
        out.println("</table>");
        
        
%>