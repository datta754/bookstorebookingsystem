<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
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

    .registration-card {
        background: #ffffff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }

    .registration-card h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
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
</style>
</head>
<body>

<div class="registration-card">
    <h2>Register</h2>
    <form action="registercustomer" method="post">

        <div class="form-group">
            <label>Full Name</label>
            <input type="text" name="fullname" required>
        </div>

        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <input type="password" name="cpassword" required>
        </div>

        <input type="submit" value="Register" class="submit-btn">

    </form>
</div>

</body>
</html>
