<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pet Adoption Platform</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Poppins:wght@300;700&display=swap" rel="stylesheet">
  
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f4f4f4; 
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    .container {
      background-color: #fff;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      display: flex;
      width: 80%; 
    }

    .text-section {
      flex: 1;
      padding: 40px;
      text-align: center;
    }

    .btn-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 20px;
    }

    .btn {
      padding: 15px 30px;
      font-size: 17px;
      margin: 15px;
      border-radius: 40px;
      cursor: pointer;
      background-color: #3498db;
      color: #fff;
      border: none;
      text-decoration: none;
      transition: transform 0.3s, box-shadow 0.3s;
    }

    .btn:hover {
      transform: translateY(-5px);
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    h1, p {
      color: #333; 
    }

    .image-section {
      flex: 1;
      overflow: hidden;
    }

    img {
      width: 100%; 
      height: auto;
      border-top-right-radius: 20px; 
      border-bottom-right-radius: 20px; 
      border-bottom-left-radius: 20px;
      margin-left:10px;
      margin-top:80px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="text-section">
      <h1>Welcome to the Pet Adoption Platform</h1>
      <h3>Adopt the perfect pet for you..</h3>
      
      <p style="text-align:justify">Welcome to our Pet Adoption Platform, where hearts find their furry companions! 🐾 
      Our platform is more than just a place to adopt pets; it's a haven of love, compassion, and endless
       tail wags. Whether you're an enthusiastic adopter ready to welcome a new member into your family or
        a dedicated pet rescue organization striving to make a difference, our platform is your stage.</p>
        
      <h4>Please select your role:</h4>
      <div class="btn-container">
        <a href="adopter.jsp"><button class="btn">Adopter</button></a>
        <a href="rescue_organization.jsp"><button class="btn">Pet Rescue Organization</button></a>
      </div>
      <div class="btn-container">
        <a href="login_admin.jsp"><button class="btn">Admin</button></a>
        
      </div>
    </div>
    <div class="image-section">
      <img src="images/adopt.jpg" alt="Background Image">
      <a href="contact_us.html"><button class="btn" style="margin-left:178px;" >Contact Us</button></a>
    </div>
  </div>
</body>
</html>
