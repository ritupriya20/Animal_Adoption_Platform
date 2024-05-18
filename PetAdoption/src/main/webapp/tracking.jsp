
<html>
<head>
    <title>Tracking Request</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .tracking-container {
            display: flex;
            justify-content: space-around;
            width: 80%;
            margin: 20px auto;
            margin-top:200px;
        }

        .animal-details, .adopter-details {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            flex: 1;
            margin: 10px;
        }

        .animal-details img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .status-container {
            text-align: center;
            margin-top: 20px;
        }
        a:hover{
        color:red;
        }
    </style>
</head>
<body>
<%@ page import="com.example.AnimalDetails" %>
<%@ page import="com.example.AdopterDetails" %>

    <h1>Tracking Request Details</h1>
    <div class="tracking-container">
    <%
        AnimalDetails animalDetails = (AnimalDetails) request.getAttribute("animalDetails");
        if (animalDetails != null) {
    %>
    <div class="animal-details">
    
    <img src="<%= animalDetails.getPhotoURL() %>" alt="Animal Photo" width=300px height=300px><br>
    <a href="#status">Check status</a>
    <p>Animal Type: <%= animalDetails.getanimalType() %></p>
    <p>Breed: <%= animalDetails.getBreed() %></p>
    <p>Gender: <%= animalDetails.getGender() %></p>
    <p>Age: <%= animalDetails.getAge() %></p>
    <p>Description: <%= animalDetails.getDescription() %></p>
    <p>Health Condition: <%= animalDetails.getHealthCondition() %></p>
    <p>Organization Name: <%= animalDetails.getOrganizationName() %></p>
    <p>Contact Info: <%= animalDetails.getContactInfo() %></p>
    <%
    
    int verifyStatus = animalDetails.getVerify();
    String status;
    switch (verifyStatus) {
        case 0:
            status = "Request Submitted and waiting for approval";
            break;
        case 1:
            status = "Request Approved and listed on Website";
            break;
        case 2:
            status = "Request Declined";
            break;
        case 3:
            status = "Adopter found";
            AdopterDetails adopterDetails = animalDetails.getAdopterDetails(animalDetails.getId());
            
            if (adopterDetails != null) {
                %>
                <p id="status"><b>Status: <%= status %></b></p>
                </div>
                <div class="adopter-details">
                <h2>Matched Adopter Details:</h2>
                <p>Adopter Name: <%= adopterDetails.getName() %></p>
                <p>Adopter Email: <%= adopterDetails.getEmail() %></p>
                <p>Adopter Phone: <%= adopterDetails.getPhone() %></p>
                <p>Adopter Address: <%= adopterDetails.getAddress() %></p>
                <p>Reason for Adoption: <%= adopterDetails.getReason() %></p>
                <p>Experience with Pets: <%= adopterDetails.getExperience() %></p>
                
            <% 
            }
            break;
        default:
            status = "Unknown";
            break;
    }
%>
<p id="status"><b>Status: <%= status %></b></p>
</div>
    <% } else { %>
    <p>No details found for the provided input.</p>
    <% } %>
    </div>
</body>
</html>


