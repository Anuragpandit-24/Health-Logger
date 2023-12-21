<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Logger App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #198754;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
        }

        .btn-outline-success {
            color: #198754;
            border-color: #198754;
        }

        .btn-outline-success:hover {
            background-color: #198754;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Dr.!</h2>
        <p>Explore the future of healthcare with our Health Logger App. Log in to access advanced features and patient data.</p>
        <form action="login.jsp">
            <input type="submit" value="Doctor Login!" class="btn btn-outline-success">
        </form>
    </div>
</body>
</html>
