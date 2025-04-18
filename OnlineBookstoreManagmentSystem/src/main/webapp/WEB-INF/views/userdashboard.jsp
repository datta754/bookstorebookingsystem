<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
    :root {
        --primary: #4361ee;
        --secondary: #3f37c9;
        --accent: #4895ef;
        --dark: #1b263b;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --danger: #f72585;
        --warning: #f8961e;
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 20px;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
    }
    
    h1 {
        color: var(--dark);
        text-align: center;
        margin: 30px 0;
        font-size: 2.5rem;
        font-weight: 700;
        text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
    }
    
    .search-container {
        max-width: 600px;
        margin: 0 auto 30px;
        padding: 20px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }
    
    .search-form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
    }
    
    .form-group label {
        margin-bottom: 8px;
        font-weight: 600;
        color: var(--dark);
    }
    
    .form-control {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1rem;
        transition: all 0.3s;
    }
    
    .form-control:focus {
        outline: none;
        border-color: var(--accent);
        box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
    }
    
    .btn-search {
        padding: 12px;
        background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-weight: 700;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s;
        margin-top: 10px;
    }
    
    .btn-search:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .book-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 30px;
        padding: 20px;
        max-width: 1400px;
        margin: 0 auto;
    }
    
    .book-card {
        background: white;
        border-radius: 16px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        padding: 20px;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        display: flex;
        flex-direction: column;
        overflow: hidden;
        position: relative;
    }
    
    .book-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.15);
    }
    
    .book-image-container {
        height: 250px;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-bottom: 15px;
        position: relative;
    }
    
    .book-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
    }
    
    .book-card:hover .book-image {
        transform: scale(1.05);
    }
    
    .book-details {
        padding: 0 5px;
        flex-grow: 1;
    }
    
    .book-title {
        font-weight: 700;
        margin-bottom: 8px;
        font-size: 1.1rem;
        color: var(--dark);
        line-height: 1.3;
    }
    
    .book-author {
        color: #6c757d;
        font-size: 0.9rem;
        margin-bottom: 10px;
        font-style: italic;
    }
    
    .book-price {
        color: var(--danger);
        font-weight: 700;
        font-size: 1.3rem;
        margin: 12px 0;
    }
    
    .book-genre {
        background-color: var(--accent);
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 0.75rem;
        display: inline-block;
        margin-top: 5px;
        color: white;
        font-weight: 600;
        letter-spacing: 0.5px;
    }
    
    .book-actions {
        margin-top: 20px;
    }
    
    .quantity-selector {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 15px;
        background: #f8f9fa;
        border-radius: 8px;
        padding: 5px;
    }
    
    .quantity-btn {
        width: 32px;
        height: 32px;
        background-color: white;
        border: none;
        border-radius: 6px;
        font-size: 1rem;
        cursor: pointer;
        color: var(--dark);
        font-weight: bold;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transition: all 0.2s;
    }
    
    .quantity-btn:hover {
        background-color: var(--light);
        transform: scale(1.05);
    }
    
    .quantity-input {
        width: 40px;
        text-align: center;
        border: none;
        background: transparent;
        font-size: 1rem;
        font-weight: 600;
        color: var(--dark);
    }
    
    .btn-buy {
        padding: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 700;
        transition: all 0.3s;
        background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        color: white;
        width: 100%;
        font-size: 1rem;
        letter-spacing: 0.5px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        position: relative;
        overflow: hidden;
    }
    
    .btn-buy:hover {
        transform: translateY(-2px);
        box-shadow: 0 7px 14px rgba(0,0,0,0.15);
    }
    
    .btn-buy:active {
        transform: translateY(0);
    }
    
    .btn-buy::after {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, rgba(255,255,255,0.2) 0%, rgba(255,255,255,0) 100%);
        opacity: 0;
        transition: opacity 0.3s;
    }
    
    .btn-buy:hover::after {
        opacity: 1;
    }
    
    .success-message {
        color: var(--success);
        text-align: center;
        margin: 20px 0;
        font-weight: 600;
        font-size: 1.1rem;
        padding: 15px;
        background: rgba(76, 201, 240, 0.1);
        border-radius: 8px;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }
    
    @media (max-width: 768px) {
        .book-container {
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .search-container {
            padding: 15px;
            margin: 0 15px 30px;
        }
    }
</style>
</head>
<body>

<h1>Welcome to Our Book Collection</h1>
<c:if test="${not empty currentUserEmail}">
    <div style="text-align: center; margin: 20px 0;">
        <a href="mybookings?email=${currentUserEmail}" style="padding: 10px 15px; background-color: #3a0ca3; color: white; text-decoration: none; border-radius: 5px;">My Bookings</a>
    </div>
</c:if>
<div class="search-container">
    <form action="searchbygenre" method="get" class="search-form">
        <div class="form-group">
            <label for="genre">Search by Genre</label>
            <input type="text" id="genre" name="genre" class="form-control" placeholder="Enter genre (e.g. Fiction, Science, Romance)">
        </div>
        <button type="submit" class="btn-search">Search Books</button>
    </form>
</div>

<c:if test="${not empty success}">
    <div class="success-message">${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="error-message">${error}</div>
</c:if>

<div class="book-container">
    <c:forEach var="book" items="${booksdata}">
    <div class="book-card">
        <div class="book-image-container">
            <c:choose>
                <c:when test="${not empty book.imagefilename}">
                    <img src="/images/${book.imagefilename}" alt="${book.title}" class="book-image" 
                         onerror="this.src='https://via.placeholder.com/300x400?text=No+Image'">
                </c:when>
                <c:otherwise>
                    <img src="https://via.placeholder.com/300x400?text=No+Image" alt="No image available" class="book-image">
                </c:otherwise>
            </c:choose>
        </div>
        <div class="book-details">
            <div class="book-title">${book.title}</div>
            <div class="book-author">by ${book.author}</div>
            <div class="book-price">₹${book.price}</div>
            <div class="book-genre">${book.genre}</div>
            
            <div class="book-actions">
                <div class="quantity-selector">
                    <button type="button" class="quantity-btn minus" onclick="updateQuantity('qty-${book.bookId}', -1)">-</button>
                    <input type="number" id="qty-${book.bookId}" class="quantity-input" value="1" min="1" max="10">
                    <button type="button" class="quantity-btn plus" onclick="updateQuantity('qty-${book.bookId}', 1)">+</button>
                </div>
                
                <form action="bookingform" method="get">
                    <input type="hidden" name="bookId" value="${book.bookId}">
                    <input type="hidden" name="quantity" id="buy-qty-${book.bookId}" value="1">
                    <input type="hidden" name="email" value="${currentUserEmail}">
                    <button type="submit" class="btn-buy">Book Now</button>
                </form>
            </div>
        </div>
    </div>
    </c:forEach>
</div>

<script>
    function updateQuantity(inputId, change) {
        const input = document.getElementById(inputId);
        let newValue = parseInt(input.value) + change;
        if (newValue < 1) newValue = 1;
        if (newValue > 10) newValue = 10;
        input.value = newValue;
        document.getElementById(`buy-qty-${inputId.split('-')[1]}`).value = newValue;
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        const quantityInputs = document.querySelectorAll('.quantity-input');
        quantityInputs.forEach(input => {
            input.addEventListener('change', function() {
                const bookId = this.id.split('-')[1];
                const value = parseInt(this.value) || 1;
                document.getElementById(`buy-qty-${bookId}`).value = value;
            });
        });
    });
</script>

</body>
</html>