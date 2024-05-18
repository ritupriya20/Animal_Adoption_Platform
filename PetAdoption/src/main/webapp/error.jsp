<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - No Animals Found</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
        }

        p {
            color: #555;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .contact-button, .home {
            display: inline-block;
            padding: 8px 15px;
            font-size: 16px;
            margin: 0 10px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            transition: background-color 0.3s, transform 0.3s;
        }

        .contact-button:hover, .home:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Sorry, No Animals Found</h1>
        <p>No animals are currently available for the given criteria/details. 
        Please try again later or contact us for assistance.</p>
        <div class="button-container">
            <a href="contact_us.html" class="contact-button">Contact Us</a>
            <a href="index.jsp" class="home">Go to home</a>
        </div>
    </div>
</body>
</html>

