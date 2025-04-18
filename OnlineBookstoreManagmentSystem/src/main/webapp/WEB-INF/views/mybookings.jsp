<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings</title>
<style>
    :root {
        --primary: #4361ee;
        --secondary: #3a0ca3;
        --accent: #4895ef;
        --dark: #14213d;
        --light: #f8f9fa;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f5f5;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    
    h1 {
        color: var(--dark);
        text-align: center;
        margin: 30px 0;
    }
    
    .back-link {
        display: inline-block;
        margin-bottom: 20px;
        padding: 10px 15px;
        background-color: var(--primary);
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    
    .back-link:hover {
        background-color: var(--secondary);
    }
    
    .bookings-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: white;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }
    
    .bookings-table th, .bookings-table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    .bookings-table th {
        background-color: var(--primary);
        color: white;
    }
    
    .bookings-table tr:hover {
        background-color: #f1f1f1;
    }
    
    .no-bookings {
        text-align: center;
        padding: 50px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }
    
    .booking-date {
        white-space: nowrap;
    }
    
    .booking-price {
        font-weight: bold;
        color: var(--secondary);
    }
</style>
</head>
<body>
<div class="container">
    <a href="userdashboard?email=${param.email}" class="back-link">← Back to Books</a>
    <h1>My Bookings</h1>
    
    <c:choose>
        <c:when test="${not empty bookings && bookings.size() > 0}">
            <table class="bookings-table">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Book Title</th>
                        <th>Author</th>
                        <th>Genre</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                        <th>Booking Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.bookingId}</td>
                        <td>${booking.book.title}</td>
                        <td>${booking.book.author}</td>
                        <td>${booking.book.genre}</td>
                        <td>${booking.quantity}</td>
                        <td>₹${booking.book.price}</td>
                        <td class="booking-price">₹${booking.totalPrice}</td>
                        <td class="booking-date">${booking.bookingDate}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <div class="no-bookings">
                <h2>No Bookings Found</h2>
                <p>You haven't made any bookings yet. Start exploring our collection!</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>