<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Admin Requests</title>
    
    <style>
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Contact Admin Requests</h1>

    
    <% 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String DB_URL = "jdbc:mysql://localhost:3306/petadoption";
            String DB_USER = "root";
            String DB_PASSWORD = "ritu06";

            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM contact_queries");

            
    %>

    <table>
        <thead>
            <tr>
                <th>Query ID</th>
                <th>User Type</th>
                <th>User Name</th>
                <th>User Email</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <% 
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("queryId") %></td>
                <td><%= rs.getString("userType") %></td>
                <td><%= rs.getString("userName") %></td>
                <td><%= rs.getString("userEmail") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("timestamp") %></td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>

    <% 
            
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</body>
</html>
