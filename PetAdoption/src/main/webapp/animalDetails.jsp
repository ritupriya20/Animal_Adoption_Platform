<%@ page import="java.util.List" %>
<%@ page import="com.example.AnimalDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Animal Details</title>
    
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            margin-top: 20px;
        }

        .animal-container {
            background-color: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 1200px;
            margin-top: 20px;
        }

        .blue-patch {
            background-color: #007bff;
            height: 20px;
            width: 100%;
        }

        .animal-box-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .animal-box {
            display: inline-block;
            width: 200px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
        }

        .animal-box img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }

        .animal-box:hover {
            transform: scale(1.1);
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            background-color: #f0f0f0;
            cursor: pointer;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.9);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: red;
            text-decoration: none;
        }

        .animal-details {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .animal-image {
            flex: 1;
            padding-right: 20px;
        }

        .animal-image img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .animal-info {
            flex: 2;
        }

        .animal-info h2 {
            font-size: 24px;
            color: #333;
        }

        .animal-info p {
            font-size: 16px;
            margin-bottom: 8px;
        }

        .highlight {
            font-weight: bold;
            color: #007bff;
        }

        .contact-info {
            font-size: 14px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .adopt{
        background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
        }
        .adopt:hover{
        background-color: #2980b9;}
    </style>
</head>

<body>
    <h1>Available Animals for Adoption</h1>

    <div class="animal-container">
        <div class="blue-patch"></div>
        <div class="animal-box-container">
            <% 
                List<AnimalDetails> animalDetailsList = (List<AnimalDetails>) request.getAttribute("animalDetailsList");
                if (animalDetailsList != null && !animalDetailsList.isEmpty()) {
                    int i = 0;
                    for (AnimalDetails animalDetails : animalDetailsList) {
            %>
                        
                        <div class="animal-box" onclick="showDetails('<%= i %>')">
                            <img src="<%= animalDetails.getPhotoURL() %>" alt="Animal">
                            <h3><%= animalDetails.getBreed() %></h3>
                            <p>Age: <%= animalDetails.getAge() %></p>
                            <p>Gender: <%= animalDetails.getGender() %></p>
                        </div>

                       
                        <div id="animalModal<%= i %>" class="modal">
                            <div class="modal-content">
                                <span class="close" onclick="hideDetails('<%= i %>')">&times;</span>
                                <div class="animal-details">
                                    <div class="animal-image">
                                        <img src="<%= animalDetails.getPhotoURL() %>" alt="Animal">
                                    </div>
                                    <div class="animal-info">
                                        <h2><%= animalDetails.getBreed() %></h2>
                                        <p><span class="highlight">Age:</span> <%= animalDetails.getAge() %></p>
                                        <p><span class="highlight">Gender:</span> <%= animalDetails.getGender() %></p>
                                        <p><span class="highlight">Description:</span> <%= animalDetails.getDescription() %></p>
                                        <p><span class="highlight">Health Condition:</span> <%= animalDetails.getHealthCondition() %></p>
                                        <hr>
                                        <h2>Pet provided by:</h2>
                                        <p><span class="highlight">Organization Name:</span> <%= animalDetails.getOrganizationName() %></p>
                                        <p class="contact-info"><span class="highlight">Contact Details:</span> <%= animalDetails.getContactInfo() %></p><br>
                                        <button class="adopt" onclick="openAdoptionRequest('<%= request.getParameter("animal") %>','<%= animalDetails.getId() %>')">Adopt</button>
                                    </div>
                                </div>
                            </div>
                        </div>

            <% 
                        i++;
                    }
                } else { 
            %>
                <p>No available animals for adoption.</p>
            <% } %>
        </div>
    </div>

    <div id="adoptionRequestModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAdoptionRequestModal()">&times;</span>
            <form id="adoptionForm" action="AdoptionRequestServlet" method="post">
                <h2>Adopter Information</h2>
                <div class="form-group">
                    <input type="hidden" id="id1" name="id" >
                    <label for="animalType">Adopting a:</label>
                    <input type="text" id="animalType" name="animalType" value="<%= request.getParameter("animal") %>" readonly onmousedown="return false;">
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
                <div class="form-group">
                    <label for="reason">Reason for Adoption:</label>
                    <textarea id="reason" name="reason" required></textarea>
                </div>
                <div class="form-group">
                    <label for="experience">Experience with Pets:</label>
                    <textarea id="experience" name="experience" required></textarea>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="infoCorrect" name="infoCorrect" required>
                        I confirm that the provided information is correct.
                    </label>
                </div>
                <div class="form-group">
                    <input type="submit" value="Submit">
                </div>
            </form>
        </div>
    </div>

    <script>
        function showDetails(index) {
            var modal = document.getElementById('animalModal' + index);
            modal.style.display = "block";
        }

        function hideDetails(index) {
            var modal = document.getElementById('animalModal' + index);
            modal.style.display = "none";
        }

        function openAdoptionRequest(animalType, id) {
            var adoptionModal = document.getElementById('adoptionRequestModal');
            adoptionModal.style.display = "block";
            var idField = document.getElementById('id1');
            idField.value = id;
        }

        function closeAdoptionRequestModal() {
            var adoptionModal = document.getElementById('adoptionRequestModal');
            adoptionModal.style.display = "none";
        }
    </script>
</body>

</html>
