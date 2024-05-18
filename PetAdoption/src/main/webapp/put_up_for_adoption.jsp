<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Put Animal Up for Adoption</title>
  <style>
    
    .animal-form {
      max-width: 600px;
      margin: 20px auto;
      padding: 20px;
      background-color: #f9f9f9;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 15px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input[type="text"],
    textarea {
      width: calc(100% - 12px); /* Adjusting width to include padding */
      padding: 8px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 16px;
    }

    textarea {
      height: 100px;
    }

    input[type="submit"] {
      padding: 10px 20px;
      background-color: #555;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #333;
    }
    select {
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #fff;
      
      cursor: pointer;
      width: 200px;
    }
     
  </style>
</head>
<body>
  

  <div class="animal-form">
  <h1 style="text-align:center;">Fill in your Animal Details for Adoption</h1>
    <form action="ProcessAdoptionServlet" method="post">
    <div class="form-group">
  <label>Preview:</label>
  <div class="image-preview">
    <img id="previewImage" src="profile.png" alt="Enter URL" style="border-radius: 50%; width: 100px; height: 100px;">
  </div>
</div>
      <div class="form-group">
        <label for="animalType">Animal Type:</label>
        <input type="text" id="animalType" name="animalType" value="<%= request.getParameter("animal") %>" readonly onmousedown="return false;">
      </div>

      <div class="form-group">
        <label for="photoURL">URL of Animal Photo:</label>
        <input type="text" id="photoURL" name="photoURL" placeholder="Enter URL of photo" oninput="updateImage(this.value)" required>
      </div>

      <div class="form-group">
        <label for="breed">Breed:</label>
        <input type="text" id="breed" name="breed" placeholder="Enter breed" required>
      </div>
      
      <div class="form-group">
      <label for="gender">Gender:</label>
      <select id="gender" name="gender" required>
        <option value="">Select Gender</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="unknown">Unknown</option>
      </select>
    </div>
      
      <div class="form-group">
        <label for="age">Age:</label>
        <input type="text" id="age" name="age" placeholder="Enter age" required>
      </div>
      
      

      <div class="form-group">
        <label for="description">Description:</label>
        <textarea id="description" name="description" placeholder="Enter description(Talk about Behavioral Traits,Training Information etc)" required></textarea>
      </div>
      
      <div class="form-group">
      <label for="healthCondition">Health Condition:</label>
      <textarea id="healthCondition" name="healthCondition" placeholder="Provide details about any pre-existing illnesses and vaccinations administered" required></textarea>
    </div>
    
    <div class="form-group">
      <label for="organizationName">Name of Organization:</label>
      <input type="text" id="organizationName" name="organizationName" placeholder="Enter organization name" required>
    </div>

    <div class="form-group">
      <label for="contactInfo">Contact Information:</label>
      <input type="text" id="contactInfo" name="contactInfo" placeholder="Enter contact information" required>
    </div>

    <div class="form-group">
      <label>
        <input type="checkbox" id="infoCorrect" name="infoCorrect" required>
        I confirm that the provided information is correct.
      </label>
    </div>


      <input type="submit" value="Submit">
    </form>
  </div>
  <script>
  function updateImage(url) {
    const previewImage = document.getElementById('previewImage');
    previewImage.src = url;
  }
</script>
  
</body>
</html>
