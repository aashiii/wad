<%-- 
    Document   : del
    Created on : 8 Nov, 2019, 3:21:48 PM
    Author     : wad13
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String mr = request.getParameter("mr");
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
        
       int i = smt.executeUpdate("update pat set name='"+name+"' dob='"+dob+"' height='"+ht+"' weight='"+wt+"' bldgrp='"+bg+"'ds='"+ds+"' addr='"+adr+"' where mr="+mr+";");
        
        out.println("Updated");
%>