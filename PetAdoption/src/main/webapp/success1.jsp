<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoption Request Successful</title>
    
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

        .success-container {
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 600px;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #007bff;
        }

        p {
            font-size: 18px;
            margin-top: 10px;
            color: #333;
        }

        .contact-info {
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h1>Adoption Request Successful!</h1>
        <p>The rescue organization will contact you soon.</p>
        <p>Your Adopter ID is: <%= request.getParameter("regNum") %></p>
        <p class="contact-info">For any inquiries, please contact us at <a href="contact_us.html">Contact Us</a></p>
    </div>
</body>
</html>
