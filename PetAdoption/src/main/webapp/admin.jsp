<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.AnimalDetails" %>
<%@ page import="com.example.AdopterDetails" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
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

        td img {
            border-radius: 50%;
            width: 50px; 
            height: 50px; 
        }
        button{
        margin-left:10px;
        }
        button:hover, a.btn:hover {
        color: #4CAF50; 
    }
      a {
      display: block;
      
      margin-top: 20px;
      font-size: 18px;
      color: #3498db;
      text-decoration: none;
    }
    .track:hover{
    	color:red;
    }
    </style>
    <script>
        function filterAnimals(animalType) {
            document.getElementById("animalTypeInput").value = animalType;
            document.getElementById("filterForm").submit();
        }
    </script>
</head>
<body>
    <h1>Welcome to the Admin Panel - Animal Management</h1>
    <%!
        public String getStatusLabel(int verifyStatus) {
            switch (verifyStatus) {
                case 0:
                    return "Pending Approval";
                case 1:
                    return "Approved";
                case 2:
                    return "Rejected";
                case 3:
                    return "Adopted";
                default:
                    return "Unknown";
            }
        }
    %>
    
    <div>
    <a href="index.jsp" class="track">Go to home</a>
    <h4>Animal Type Filters</h4>
    <button onclick="filterAnimals('all')">Show All</button>
    <button onclick="filterAnimals('Dog')">Show Dogs</button>
    <button onclick="filterAnimals('Cat')">Show Cats</button>
    <button onclick="filterAnimals('Rabbit')">Show Rabbits</button>
    <button onclick="filterAnimals('Birds')">Show Birds</button>
	</div>
	<div>
	    <h4>Additional Filters</h4>
	    <button onclick="filterAnimals('Approved')">Show Approved</button>
	    <button onclick="filterAnimals('Rejected')">Show Rejected</button>
	    <button onclick="filterAnimals('Adopted')">Show Adopted</button>
	    <button onclick="filterAnimals('Pending')">Show Pending Requests</button>
	</div>
	<div>
	<br>
	<a href="contact_admin.jsp"><button class="btn">View User Contact Requests</button></a>
    </div>
    <!-- Animal Table -->
    <form id="filterForm" action="AdminActionsServlet" method="post">
        <input type="hidden" id="animalTypeInput" name="animalType" value="<%= request.getAttribute("selectedAnimalType") %>">
        <table>
            <thead>
                <tr>
                    <th>Animal ID</th>
                    <th>Breed</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Status</th>
                    <th>Organization Name</th>
                    <th>Contact Information</th>
                    <th>Description</th>
                    <th>Health Condition</th>
                    <% if (request.getAttribute("selectedAnimalType") != null && request.getAttribute("selectedAnimalType").equals("Adopted")) { %>
                        <th>Adopter ID</th>
                        <th>Adopter Name</th>
                        <th>Adopter Email ID</th>
                        <th>Adopter Phone</th>
                        <th>Adopter Address</th>
                        <th>Reason of Adopting</th>
                        <th>Experience</th>
                    <% } %>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<AnimalDetails> animalDetailsList = (List<AnimalDetails>) request.getAttribute("animalDetailsList");
                    if (animalDetailsList != null && !animalDetailsList.isEmpty()) {
                        for (AnimalDetails animalDetails : animalDetailsList) {
                %>
                            <tr>
                                <td><%= animalDetails.getId() %><br><img src="<%= animalDetails.getPhotoURL() %>" alt="Animal"></td>
                                <td><%= animalDetails.getBreed() %></td>
                                <td><%= animalDetails.getAge() %></td>
                                <td><%= animalDetails.getGender() %></td>
                                <td><%= getStatusLabel(animalDetails.getVerify()) %></td>
                                <td><%= animalDetails.getOrganizationName() %></td>
                                <td><%= animalDetails.getContactInfo() %></td>
                                <td><%= animalDetails.getDescription() %></td>
                                <td><%= animalDetails.getHealthCondition() %></td>
                                <% if (request.getAttribute("selectedAnimalType") != null && request.getAttribute("selectedAnimalType").equals("Adopted")) { 
                                    AdopterDetails adopterDetails = animalDetails.getAdopterDetails(animalDetails.getId());
                                    if (adopterDetails != null) {
                                %>
                                        <td><%= adopterDetails.getId() %></td>
                                        <td><%= adopterDetails.getName() %></td>
                                        <td><%= adopterDetails.getEmail() %></td>
                                        <td><%= adopterDetails.getPhone() %></td>
                                        <td><%= adopterDetails.getAddress() %></td>
                                        <td><%= adopterDetails.getReason() %></td>
                                        <td><%= adopterDetails.getExperience() %></td>
                                <% } %>
                                <% } %>
                                <td>
                                    <button type="submit" name="action" value="approve_<%= animalDetails.getId() %>">Approve</button>
                                    <button type="submit" name="action" value="reject_<%= animalDetails.getId() %>">Reject</button>
                                    <button type="submit" name="action" value="delete_<%= animalDetails.getId() %>">Delete</button>
                                </td>
                            </tr>
                <%
                        }
                    } else {
                        if (request.getAttribute("selectedAnimalType") != null && request.getAttribute("selectedAnimalType").equals("Adopted")) { 
                %>
                            <tr>
                                <td colspan="10">No animals found. Select a different filter.</td>
                            </tr>
                <%
                        } else {
                %>
                            <tr>
                                <td colspan="17">No animals found. Select a different filter.</td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </form>
</body>
</html>

