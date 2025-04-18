<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background-color: #fff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        width: 350px;
        text-align: center;
    }

    .login-container h2 {
        margin-bottom: 24px;
        color: #333;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
    }

    .login-container input[type="submit"] {
        background-color: #2575fc;
        color: white;
        border: none;
        padding: 12px;
        width: 100%;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .login-container input[type="submit"]:hover {
        background-color: #1a5edb;
    }
</style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="loginadmin" method="get">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
