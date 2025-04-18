<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Entry Form</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
    }

    .form-container {
        background-color: #fff;
        padding: 25px 30px;
        max-width: 500px;
        margin: auto;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    label {
        display: block;
        margin-top: 15px;
        color: #555;
    }

    input[type="text"],
    input[type="date"],
    input[type="number"],
    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    button {
        margin-top: 20px;
        width: 100%;
        padding: 12px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

<div class="form-container">
    <h2>Book Entry Form</h2>
    <form action="savebookinfo" method="post" enctype="multipart/form-data">
        <label for="title">Book Title</label>
        <input type="text" id="title" name="title" required>

        <label for="genre">Genre</label>
        <input type="text" id="genre" name="genre" required>

        <label for="author">Author</label>
        <input type="text" id="author" name="author" required>

        <label for="publicationdate">Publication Date</label>
        <input type="date" id="publicationdate" name="publicationdate" required>

        <label for="price">Price (in ₹)</label>
        <input type="number" step="0.50" id="price" name="price" required>

        <label for="imagefile">Book Image</label>
        <input type="file" id="imagefile" name="imagefile" accept="image/*" required>

        <button type="submit">Add Book</button>
    </form>
</div>

</body>
</html>