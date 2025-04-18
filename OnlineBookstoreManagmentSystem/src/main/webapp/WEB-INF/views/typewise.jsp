<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${not empty param.genre ? param.genre : 'All Genres'}</title>
<style>
    :root {
        --primary: #4361ee;
        --secondary: #3a0ca3;
        --accent: #4895ef;
        --dark: #14213d;
        --light: #f8f9fa;
        --success: #4cc9f0;
        --danger: #f72585;
        --warning: #f8961e;
        --text: #2b2d42;
        --gray: #adb5bd;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
        color: var(--text);
        line-height: 1.6;
    }
    
    .header {
        text-align: center;
        padding: 30px 20px;
    }
    
    .genre-title {
        font-size: 2rem;
        color: var(--dark);
        margin-bottom: 10px;
    }
    
    .genre-subtitle {
        color: var(--gray);
        font-size: 1.1rem;
    }
    
    .empty-message {
        text-align: center;
        padding: 60px 20px;
        max-width: 600px;
        margin: 0 auto;
    }
    
    .empty-icon {
        font-size: 4rem;
        color: var(--gray);
        margin-bottom: 20px;
    }
    
    .empty-title {
        font-size: 1.8rem;
        color: var(--dark);
        margin-bottom: 15px;
    }
    
    .empty-text {
        color: var(--gray);
        font-size: 1.1rem;
        margin-bottom: 30px;
    }
    
    .btn-explore {
        padding: 12px 24px;
        background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-weight: 600;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s;
        text-decoration: none;
        display: inline-block;
    }
    
    .btn-explore:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .book-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 30px;
        padding: 40px;
        max-width: 1400px;
        margin: 0 auto;
    }
    
    .book-card {
        background: white;
        border-radius: 16px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        overflow: hidden;
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
    }
    
    .book-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.12);
    }
    
    .book-image-container {
        height: 320px;
        overflow: hidden;
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
        padding: 20px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }
    
    .book-title {
        font-size: 1.2rem;
        font-weight: 600;
        margin-bottom: 8px;
        color: var(--dark);
    }
    
    .book-author {
        color: var(--gray);
        font-size: 0.9rem;
        margin-bottom: 12px;
    }
    
    .book-price {
        color: var(--danger);
        font-weight: 700;
        font-size: 1.4rem;
        margin: 10px 0 15px;
    }
    
    .book-genre {
        background-color: var(--accent);
        color: white;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 0.75rem;
        display: inline-block;
        margin-bottom: 15px;
        font-weight: 500;
        align-self: flex-start;
    }
    
    .book-actions {
        margin-top: auto;
    }
    
    .quantity-selector {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 15px;
        background: #f1f3f5;
        border-radius: 8px;
        padding: 5px;
    }
    
    .quantity-btn {
        width: 34px;
        height: 34px;
        background-color: white;
        border: none;
        border-radius: 6px;
        font-size: 1rem;
        cursor: pointer;
        color: var(--dark);
        font-weight: bold;
        transition: all 0.2s;
    }
    
    .quantity-btn:hover {
        background-color: #e9ecef;
    }
    
    .quantity-input {
        width: 50px;
        text-align: center;
        border: none;
        background: transparent;
        font-size: 1rem;
        font-weight: 600;
        color: var(--dark);
    }
    
    .btn-buy {
        width: 100%;
        padding: 14px;
        background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
        color: white;
        border: none;
        border-radius: 8px;
        font-weight: 600;
        font-size: 1rem;
        cursor: pointer;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
    }
    
    .btn-buy:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
    }
    
    .btn-buy:active {
        transform: translateY(0);
    }
    
    @media (max-width: 768px) {
        .book-container {
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            padding: 20px;
            gap: 20px;
        }
        
        .book-image-container {
            height: 280px;
        }
        
        .genre-title {
            font-size: 1.6rem;
        }
    }
</style>
</head>
<body>

<div class="header">
    <h1 class="genre-title">${not empty param.genre ? param.genre : 'All Genres'}</h1>
    <p class="genre-subtitle">${not empty param.genre ? 'Books in this genre' : 'Browse our collection'}</p>
</div>

<c:choose>
    <c:when test="${not empty gbd && gbd.size() > 0}">
        <div class="book-container">
            <c:forEach var="book" items="${gbd}">
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
    </c:when>
    <c:otherwise>
        <div class="empty-message">
            <div class="empty-icon">
                <i class="fas fa-book-open"></i>
            </div>
            <h2 class="empty-title">No Books Found</h2>
            <p class="empty-text">
                ${not empty param.genre 
                  ? 'We couldn\'t find any books in the ' += param.genre += ' genre.' 
                  : 'There are currently no books available in this collection.'}
            </p>
            <a href="/userdashboardgenre?email=${currentUserEmail}" class="btn-explore">Explore All Books</a>
        </div>
    </c:otherwise>
</c:choose>

<script>
    function updateQuantity(inputId, change) {
        const input = document.getElementById(inputId);
        let newValue = parseInt(input.value) + change;
        if (newValue < 1) newValue = 1;
        if (newValue > 10) newValue = 10;
        input.value = newValue;
        document.getElementById(`buy-qty-${inputId.split('-')[1]}`).value = newValue;
    }
</script>

</body>
</html>