<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin panel</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f5f5f5;
    }
    h1 {
        color: #333;
    }
    a {
        display: inline-block;
        margin: 10px 0;
        padding: 8px 15px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .section {
        margin-bottom: 40px;
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
</style>
</head>
<body>
<h1>Welcome Admin</h1>
<a href="allbookings">View All Bookings</a><br><br>
<a href="addform">Add Book</a><br><br>

<div class="section">
    <h2>Books</h2>
    <table>
        <tr>
            <th>Book Id</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Publication Date</th>
            <th>Author</th>
            <th>Price</th>
            <th>Image</th>
        </tr>
        <c:forEach var="bookd" items="${booksdata}">
        <tr>
            <td>${bookd.bookId}</td>
            <td>${bookd.title}</td>
            <td>${bookd.genre}</td>
            <td>${bookd.publicationdate}</td>
            <td>${bookd.author}</td>
            <td>₹${bookd.price}</td>
            <td>${bookd.imagefilename}</td>
        </tr>
        </c:forEach>
    </table>
</div>

<div class="section">
    <h2>Users</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Username</th>
            <th>Email</th>
        </tr>
        <c:forEach var="user" items="${usersdata}">
        <tr>
            <td>${user.id}</td>
            <td>${user.fullname}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>