<%-- 
    Document   : en
    Created on : 31 Oct, 2019, 3:13:16 PM
    Author     : wad13
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String name = request.getParameter("nm");
        String dob = request.getParameter("dob");
        String ht = request.getParameter("ht");
        String wt = request.getParameter("wt");
        String bg = request.getParameter("bg");
        String ds = request.getParameter("ds");
        String adr = request.getParameter("adr");
        
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
        
        int i = smt.executeUpdate("insert into pat(name,dob,height,weight,bldgrp,ds,addr) values('"+name+"','"+dob+"','"+ht+"','"+wt+"','"+bg+"','"+ds+"','"+adr+"');");
        
        if(i==1)
            out.println("Enrolled");
        ResultSet rs=smt.executeQuery("Select * from pat;");
        
%>