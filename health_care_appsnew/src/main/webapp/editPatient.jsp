<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Patient</title>
</head>
<body>
    <h2>Edit Patient</h2>
    <form action="PatientController" method="post">
        <input type="hidden" name="action" value="updatePatient">
        <input type="hidden" name="id" value="${patient.id}">
        <!-- Add form fields for updating patient details -->
        <input type="submit" value="Update Patient">
    </form>
</body>
</html>