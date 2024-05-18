<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Success Page</title>
    <style>
        body {
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: green;
        }

        p {
            margin: 10px 0;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }
        a:hover{
        color:red;
        cursor:pointer;}
    </style>
</head>
<body>
    <div class="container">
        <h1>Success!</h1>
        <% 
            int regNum = Integer.parseInt(request.getParameter("regNum"));
            String authPass = request.getParameter("authPass");
        %>
        <p>Note down the following for future reference:</p>
        <br>
        <p><b>Registration Number:</b> <%= regNum %></p>
        <p><b>Authorization Pass:</b> <%= authPass %></p><br>

        <a href="trackrequest.jsp">Track your request</a>
    </div>
</body>
</html>
