<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Home Page</title>
    <!-- Add Bootstrap CSS link here -->
    <link rel="stylesheet" href="path/to/bootstrap.css">
    <!-- Optionally, add your custom CSS styles here -->
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px; /* Add some padding for better appearance */
            font-family: 'Roboto', sans-serif;
        }
        h2 {
            color: #007bff; /* Bootstrap primary color for headings */
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            text-align: center;
        }
        .logo {
            max-width: 200px;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none; /* Remove default list styling */
            padding: 0;
            margin-top: 20px;
        }
        li {
            margin-bottom: 10px;
        }
        a {
            text-decoration: none;
        }
        .btn-custom {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
        }
        .btn-success {
            background-color: #28a745;
            color: #fff;
            border: none;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Replace the placeholder link with the actual URL of your home logo -->
    <img src="https://icons8.com/icon/EDZuk72S1FJ7/home" alt="Your Logo" class="logo">

    <%
    Object obj = session.getAttribute("admin");
    if(obj==null){
        response.sendRedirect("login.jsp");
    } else {
    %>
        <h2>Welcome to Admin Home Page</h2>

        <ul>
            <li><a href="Patientlist.jsp" class="btn btn-custom btn-primary"> Patients List</a></li>
            <li><a href="addPatient.jsp" class="btn btn-custom btn-success">Add Patient</a></li>
            
        </ul>
    <%
    }
    %>
</div>

<!-- Add Bootstrap JS and Popper.js scripts at the end of the body -->
<script src="path/to/bootstrap.bundle.js"></script>
<script src="path/to/popper.js"></script>

</body>
</html>
