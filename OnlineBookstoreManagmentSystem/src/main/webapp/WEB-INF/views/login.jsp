<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f3f4f6;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-card {
        background: #ffffff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    .login-card h2 {
        margin-bottom: 30px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        color: #444;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 14px;
        transition: border-color 0.3s;
    }

    .form-group input:focus {
        border-color: #007bff;
        outline: none;
    }

    .submit-btn {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s;
    }

    .submit-btn:hover {
        background: #0056b3;
    }

    .register-link {
        margin-top: 20px;
        font-size: 14px;
        color: #555;
    }

    .register-link a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .register-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="login-card">
    <h2>Customer Login</h2>
    <form action="logincustomer" method="get">

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" value="Login" class="submit-btn">
    </form>

    <div class="register-link">
        New here? <a href="customerregister">Register here</a>
    </div>
</div>

</body>
</html>
