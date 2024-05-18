<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Track Animal Application Request</title>
<style>
body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        select, input {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        </style>
</head>
<body>
<form action="TrackRequestDetailsServlet" method="post">
    Animal Type:
    <select name="animalType">
        <option value="dog">Dog</option>
        <option value="cat">Cat</option>
        <option value="rabbit">Rabbit</option>
        <option value="birds">Bird</option>
    </select><br>
    Registration Number: <input type="text" name="registrationNumber" required><br>
    Authorization Pass: <input type="password" name="authorizationPass" required><br>
    <input type="submit" value="Track Request">
</form>
</body>
</html>