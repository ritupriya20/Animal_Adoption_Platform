<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Adopt Animals</title>
  <!-- Your CSS styles -->
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }

    h1 {
      text-align: center;
      margin-top: 30px;
    }
    
    .animal-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      align-items: center;
      margin: 20px;
    }
    
    .animal-button {
      width: 240px;
      height: 240px;
      border: 2px solid transparent;
      margin: 10px;
      overflow: hidden;
      position: relative;
      border-radius: 10px;
      transition: transform 0.3s, border-color 0.3s;
    }
    
    .animal-button img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.3s;
      border-radius: 10px;
    }
    
    .animal-button h2 {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      opacity: 0;
      transition: opacity 0.3s, transform 0.3s;
      color: #fff;
      font-size: 24px;
      text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
    }
    
    .animal-button:hover {
      border-color: #555;
      transform: scale(1.05);
    }
    
    .animal-button:hover img {
      transform: scale(1.1);
    }
    
    .animal-button:hover h2 {
      opacity: 1;
    }
    .container {
      background-color: #fff; /* White background */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      padding: 20px;
      margin-top:40px;
      
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Which animal would you like to adopt?</h1>
  
  <div class="animal-container">
    <!-- Animal Buttons -->
    <a href="RetrieveDetailsForAdopterServlet?animal=Dog" class="animal-button">
      <img src="images/dogs.jpeg" alt="Dog">
      <h2>Dog</h2>
    </a>
    
    <a href="RetrieveDetailsForAdopterServlet?animal=Cat" class="animal-button">
      <img src="images/cat.jpeg" alt="Cat">
      <h2>Cat</h2>
    </a>
    
    <a href="RetrieveDetailsForAdopterServlet?animal=Rabbit" class="animal-button">
      <img src="images/rabit.jpg" alt="Rabbit">
      <h2>Rabbit</h2>
    </a>
    
    <a href="RetrieveDetailsForAdopterServlet?animal=Birds" class="animal-button">
      <img src="images/bird.jpeg" alt="Birds">
      <h2>Birds</h2>
    </a>
  </div>
  </div>
</body>
</html>