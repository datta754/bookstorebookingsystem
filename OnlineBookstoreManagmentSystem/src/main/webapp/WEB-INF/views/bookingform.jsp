<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Form</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f5f7fa;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    .booking-container {
        background: white;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 700px;
    }

    .booking-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .booking-header h2 {
        color: #333;
        margin-bottom: 10px;
        font-size: 28px;
    }

    .booking-details {
        display: flex;
        gap: 30px;
        margin-bottom: 30px;
        padding: 20px;
        background: #f9f9f9;
        border-radius: 12px;
    }

    .book-image {
        width: 180px;
        height: 240px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    .book-info {
        flex: 1;
    }

    .book-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 8px;
        color: #333;
    }

    .book-author {
        color: #666;
        margin-bottom: 12px;
        font-size: 1rem;
    }

    .book-price {
        font-size: 1.3rem;
        font-weight: 700;
        color: #d32f2f;
        margin-bottom: 15px;
    }

    .book-quantity {
        font-size: 1.1rem;
        color: #444;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #444;
    }

    .form-group input, 
    .form-group textarea {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s;
    }

    .form-group input:focus, 
    .form-group textarea:focus {
        border-color: #4361ee;
        outline: none;
    }

    .form-group textarea {
        min-height: 100px;
        resize: vertical;
    }

    .total-price {
        font-size: 1.4rem;
        font-weight: 700;
        text-align: right;
        margin: 25px 0;
        color: #333;
        padding: 15px;
        background: #f5f5f5;
        border-radius: 8px;
    }

    .btn-submit {
        width: 100%;
        padding: 15px;
        background: #4361ee;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.3s;
    }

    .btn-submit:hover {
        background: #3a0ca3;
    }

    @media (max-width: 768px) {
        .booking-details {
            flex-direction: column;
        }
        
        .book-image {
            width: 100%;
            height: auto;
            max-height: 300px;
        }
    }
</style>
</head>
<body>
<div class="booking-container">
    <div class="booking-header">
        <h2>Complete Your Booking</h2>
    </div>
    
    <div class="booking-details">
        <img src="/images/${book.imagefilename}" alt="${book.title}" class="book-image" 
             onerror="this.src='https://via.placeholder.com/300x400?text=No+Image'">
        <div class="book-info">
            <h3 class="book-title">${book.title}</h3>
            <p class="book-author">by ${book.author}</p>
            <p class="book-price">₹${book.price}</p>
            <p class="book-quantity">Quantity: ${quantity}</p>
        </div>
    </div>
    
    <form action="booknow" method="post">
        <input type="hidden" name="bookId" value="${book.bookId}">
        <input type="hidden" name="quantity" value="${quantity}">
        <input type="hidden" name="email" value="${email}">
        
        <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" id="fullname" name="fullname" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" required>
        </div>
        
        <div class="form-group">
            <label for="address">Delivery Address</label>
            <textarea id="address" name="address" rows="4" required></textarea>
        </div>
        
        <div class="total-price">
            Total Price: ₹${book.price * quantity}
        </div>
        
        <button type="submit" class="btn-submit">Confirm Booking</button>
    </form>
</div>
</body>
</html>