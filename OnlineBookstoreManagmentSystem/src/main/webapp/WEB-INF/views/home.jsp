<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Bookstore - Home</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
    }

    .navbar {
        background-color: #333;
        overflow: hidden;
        padding: 12px 20px;
    }

    .navbar a {
        float: right;
        color: white;
        text-align: center;
        padding: 10px 16px;
        text-decoration: none;
        font-size: 16px;
        border-radius: 5px;
        margin-left: 10px;
        transition: background-color 0.3s ease;
    }

    .navbar a:hover {
        background-color: #575757;
    }

    .header {
        text-align: center;
        padding: 60px 20px;
        background: linear-gradient(to right, #fbc2eb, #a6c1ee);
        color: #333;
    }

    .header h1 {
        font-size: 48px;
        margin-bottom: 10px;
    }

    .header p {
        font-size: 20px;
        margin-top: 0;
    }

    .features {
        display: flex;
        justify-content: center;
        gap: 30px;
        padding: 40px 20px;
        text-align: center;
    }

    .feature-box {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 250px;
        transition: transform 0.3s ease;
    }

    .feature-box:hover {
        transform: translateY(-5px);
    }

    .feature-box h3 {
        margin-bottom: 10px;
        color: #444;
    }

    .feature-box p {
        color: #666;
        font-size: 14px;
    }
</style>
</head>
<body>

<div class="navbar">
    <a href="adminlogin">Admin Login</a>
    <a href="customerlogin">Login</a>
</div>

<div class="header">
    <h1>Welcome to DRS Bookstore</h1>
    <p>Your one-stop shop for all your reading needs!</p>
</div>

<div class="features">
    <div class="feature-box">
        <h3>Wide Selection</h3>
        <p>Thousands of books across all genres: fiction, tech, self-help, and more.</p>
    </div>
    <div class="feature-box">
        <h3>Easy Login</h3>
        <p>Access your account anytime with secure login for both customers and admins.</p>
    </div>
    <div class="feature-box">
        <h3>Fast Delivery</h3>
        <p>Enjoy lightning-fast delivery on all your favorite titles across India.</p>
    </div>
</div>

</body>
</html>
