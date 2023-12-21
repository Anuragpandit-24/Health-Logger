<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body {
            background-image: url('https://example.com/your-background-image.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #ffffff;
            font-family: 'Arial', sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 15px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }

        h2 {
            text-align: center;
            color: #495057;
        }

        label {
            color: #495057;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            background-color: #f5f5f5;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #ffffff;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        input[type="submit"] {
            background-color: #28a745; /* Green */
            margin-bottom: 10px;
        }

        input[type="reset"] {
            background-color: #dc3545; /* Red */
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            filter: brightness(110%);
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Login Page</h2>
        <form action="LoginController" method="post" class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" class="form-control" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
            <input type="submit" value="Submit" class="btn btn-success">
            <input type="reset" value="Reset" class="btn btn-danger">
        </form>
    </div>
</body>
</html>
