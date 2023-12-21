<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.healthcare.entity.Patient;" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>List Patients</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        button {
            cursor: pointer;
        }
        
       
    </style>
</head>
<body>





    <div class="container">
        <h2 class="text-center">List of Patients</h2>

        <!-- Search bar for patient ID -->
        <div class="form-group">
            <label for="searchId">Search by ID:</label>
            <input type="text" class="form-control" id="searchId" placeholder="Enter Patient ID">
            <button class="btn btn-primary mt-2" onclick="searchPatient()">Search</button>
        </div>
        
        <!-- Patient details table -->
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Age</th>
                    <th>Diagnosis</th>
                    <th>Remark</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Use JSTL or Java to loop through the patient list and populate the table -->
                <c:forEach var="patient" items="${patientList}">
                    <tr>
                        <td>${patient.id}</td>
                        <td>${patient.name}</td>
                        <td>${patient.email}</td>
                        <td>${patient.phone}</td>
                        <td>${patient.age}</td>
                        <td>${patient.diagnosis}</td>
                        <td>${patient.remark}</td>
                        <td>${patient.gender}</td>
                        <td>
                            <!-- Action buttons for each patient -->
                            <button class="btn btn-info btn-sm" onclick="manageVisit(${patient.id})">Manage Visit</button>
                            <button class="btn btn-warning btn-sm" onclick="updatePatient(${patient.id})">Update</button>
                            <button class="btn btn-danger btn-sm" onclick="deletePatient(${patient.id})">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="addPatient.jsp" class="btn btn-primary mt-3">Add Another Patient</a>
    </div>

    <!-- Add Bootstrap JS and jQuery scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Add your JavaScript functions for search and actions -->
    <script>
        function searchPatient() {
            var searchId = $('#searchId').val();
            var searchId = $('#searchId').val();
            var filteredList = patientList.filter(function(patient) {
                return patient.id == searchId;
            });
            
            updateTable(filteredList);
        }

        function manageVisit(patientId) {
        	alert("Manage visit for Patient ID: " + patientId);
        }

        function updatePatient(patientId) {
        	alert("Update details for Patient ID: " + patientId);        }

        function deletePatient(patientId) {
        	alert("Delete Patient ID: " + patientId);
        }
        function updateTable(newList) {
            var tbody = $('table tbody');
            tbody.empty(); // Clear the existing rows

            $.each(newList, function(index, patient) {
                var row = $('<tr>');
                row.append($('<td>').text(patient.id));
                row.append($('<td>').text(patient.name));
                row.append($('<td>').text(patient.email));
                row.append($('<td>').text(patient.phone));
                row.append($('<td>').text(patient.age));
                row.append($('<td>').text(patient.diagnosis));
                row.append($('<td>').text(patient.remark));
                row.append($('<td>').text(patient.gender));

                var actions = $('<td>');
                actions.append($('<button class="btn btn-info btn-sm">').text('Manage Visit').click(function() {
                    manageVisit(patient.id);
                }));
                actions.append($('<button class="btn btn-warning btn-sm">').text('Update').click(function() {
                    updatePatient(patient.id);
                }));
                actions.append($('<button class="btn btn-danger btn-sm">').text('Delete').click(function() {
                    deletePatient(patient.id);
                }));

                row.append(actions);
                tbody.append(row);
            });
        }
        
    </script>
</body>
</html>