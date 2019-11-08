<%-- 
    Document   : search
    Created on : 8 Nov, 2019, 2:50:29 PM
    Author     : wad13
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        String mr = request.getParameter("mr");
        
        
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
        while(rs.next())
        {
            if(mr==rs.getString("mr"));
            {
                out.println("Name:"+rs.getString("name"));
                out.println("Disease"+rs.getString("ds"));
                out.println("BloodGroup"+rs.getString("bldgrp"));
                break;
            }
        }
        
        
%>