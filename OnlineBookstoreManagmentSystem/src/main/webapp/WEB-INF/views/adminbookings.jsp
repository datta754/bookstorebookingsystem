<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Bookings</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f5f5;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    
    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }
    
    .bookings-table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    
    .bookings-table th, .bookings-table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    .bookings-table th {
        background-color: #4361ee;
        color: white;
    }
    
    .bookings-table tr:hover {
        background-color: #f5f5f5;
    }
    
    .status-confirmed {
        color: #2196F3;
        font-weight: bold;
    }
    
    .status-shipped {
        color: #FFC107;
        font-weight: bold;
    }
    
    .status-delivered {
        color: #4CAF50;
        font-weight: bold;
    }
    
    .status-cancelled {
        color: #F44336;
        font-weight: bold;
    }
    
    .action-btn {
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 5px;
    }
    
    .btn-ship {
        background-color: #FFC107;
        color: #000;
    }
    
    .btn-deliver {
        background-color: #4CAF50;
        color: white;
    }
    
    .btn-cancel {
        background-color: #F44336;
        color: white;
    }
</style>
</head>
<body>
<div class="container">
    <h1>All Bookings</h1>
    
    <table class="bookings-table">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Customer</th>
                <th>Book</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Date</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${allbookings}">
            <tr>
                <td>${booking.bookingId}</td>
                <td>${booking.customer.fullname}</td>
                <td>${booking.book.title}</td>
                <td>${booking.quantity}</td>
                <td>₹${booking.totalPrice}</td>
                <td>${booking.bookingDate}</td>
                <td>${booking.phone}</td>
                <td>${booking.address}</td>
                <td class="status-${booking.status.toLowerCase()}">${booking.status}</td>
                <td>
                    <c:if test="${booking.status == 'Confirmed'}">
                        <button class="action-btn btn-ship">Ship</button>
                        <button class="action-btn btn-cancel">Cancel</button>
                    </c:if>
                    <c:if test="${booking.status == 'Shipped'}">
                        <button class="action-btn btn-deliver">Deliver</button>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>